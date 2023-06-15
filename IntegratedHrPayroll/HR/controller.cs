using MySqlX.XDevAPI.Relational;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.HR
{
    public class controller
    {
        private static ConnectSqlServer DBHR = new ConnectSqlServer();
        private static ConnectMysql DBPR = new ConnectMysql();

        // Time hiện tại
        private static long currentTimeMillis()
        {
            DateTime dateTime = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return (DateTime.UtcNow.Ticks - dateTime.Ticks) / 10000L;
        }

        private static readonly string[] VietNamChar = new string[]
        {
            "aAeEoOuUiIdDyY",
            "áàạảãâấầậẩẫăắằặẳẵ",
            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
            "éèẹẻẽêếềệểễ",
            "ÉÈẸẺẼÊẾỀỆỂỄ",
            "óòọỏõôốồộổỗơớờợởỡ",
            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
            "úùụủũưứừựửữ",
            "ÚÙỤỦŨƯỨỪỰỬỮ",
            "íìịỉĩ",
            "ÍÌỊỈĨ",
            "đ",
            "Đ",
            "ýỳỵỷỹ",
            "ÝỲỴỶỸ"
        };
        private static string utf8Convert1(string str)
        {
            //Thay thế và lọc dấu từng char      
            for (int i = 1; i < VietNamChar.Length; i++)
            {
                for (int j = 0; j < VietNamChar[i].Length; j++)
                    str = str.Replace(VietNamChar[i][j], VietNamChar[0][i - 1]);
            }
            return str;
        }

        // DashboardPage

        private class DataDashBoard
        {
            public List<object> listEmp = new List<object>();
            public long lastTimeUpdate;
        }

        private static DataDashBoard dash = new DataDashBoard();

        public static void loadDashboardPage(Dashboard dashboard)
        {
            if (currentTimeMillis() - dash.lastTimeUpdate < 30000)
            {
                dashboard.Session["data"] = JsonConvert.SerializeObject(dash.listEmp);
                return;
            }
            dash.lastTimeUpdate = currentTimeMillis();
            string sql = "SELECT Department, COUNT(*) AS EmployeeCount " +
                "FROM Job_History " +
                "WHERE End_Date IS NULL " +
                "GROUP BY Department";
            var tb = DBHR.getData(sql);
            dash.listEmp = new List<object>();
            for (int i = 0; i < tb.Rows.Count; i++)
                dash.listEmp.Add(new
                {
                    label = tb.Rows[i][0] + "",
                    value = tb.Rows[i][1] + ""
                });
            dashboard.Session["data"] = JsonConvert.SerializeObject(dash.listEmp);
        }


        //  EmployeePage

        public static void loadEmployeePage(Employee employee)
        {
            string name = (employee.Request.Form["search_input"] + "").Trim();
            string sql = "SELECT p.Employee_ID," +
                "(p.Last_Name+' '+p.Middle_Initial+' '+p.First_name) AS EmployeeName," +
                "Case When p.Gender=0 then N'Nữ' When p.Gender=1 then N'Nam' Else N'Khác' End AS Gender," +
                "p.Ethnicity As Nation, " +
                "j.Department, " +
                "CONVERT(VARCHAR(10), j.Start_Date, 101) AS Working_Day " +
                "FROM Personal as p " +
                "INNER JOIN HR.dbo.Job_History AS j ON p.Employee_ID = j.Employee_ID " +
                "WHERE j.End_Date IS NULL ";
            employee.Session["search-input"] = name;
            if (name != "")
            {
                name = name.ToLower();
                name = utf8Convert1(name);
                sql += $" And (p.First_Name LIKE N'%{name}%' OR p.Last_Name LIKE N'%{name}%' OR p.Middle_Initial LIKE N'%{name}%') ";
            }
            var tb = DBHR.getData(sql);

            string sql2 = "Select CAST(Employee_Number AS DECIMAL(18,0)) as Employee_ID, Vacation_Days as Day_Off from employee ";
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                if (i == 0) sql2 += " WHERE ";
                if (i > 0) sql2 += " OR ";
                sql2 += " Employee_Number=" + tb.Rows[i][0];
            }
            var ds = DBPR.gettable(sql2);
            var tb2 = (ds.Tables.Count > 0 ? ds.Tables[0] : null);

            employee.Session["data_employee"] = JsonConvert.SerializeObject(tb);
            employee.Session["data_employee2"] = JsonConvert.SerializeObject(tb2);
        }


        // Warning page

        public static void loadWarningPage(Warning warning)
        {

        }
    }
}