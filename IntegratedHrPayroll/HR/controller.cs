using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IntegratedHrPayroll.HR
{
    public class controller
    {
        private static ConnectSqlServer DBHR = new ConnectSqlServer();
        private static ConnectMysql DBPR = new ConnectMysql();

        // Khu vực code của DashboardPage
        public static void loadDashboardPage(Dashboard dashboard)
        {
            string sql = "SELECT Department, COUNT(*) AS EmployeeCount " +
                "FROM Job_History " +
                "WHERE End_Date IS NULL " +
                "GROUP BY Department";
            var tb = DBHR.getData(sql);
            List<object> datadepart = new List<object>();
            for (int i = 0; i < tb.Rows.Count; i++)
                datadepart.Add(new
                {
                    label = tb.Rows[i][0] + "",
                    value = tb.Rows[i][1] + ""
                });
            dashboard.Session["data"] = JsonConvert.SerializeObject(datadepart);
        }


        // Khu vực code của EmployeePage
        public static void loadEmployeePage(Employee employee)
        {
            string format = $"CONCAT(First_Name, ' ', Middle_Initial, ' ', Last_Name) AS EmployeeName," +
                            $"CASE WHEN Gender = 0 THEN 'Nữ' WHEN Gender = 1 THEN 'Nam' ELSE 'Khác' END AS Gender," +
                            $"Nation," +
                            $"";
            string sql = $"SELECT {format} FROM Personal";
            string name = (employee.Request.Form["search_input"] + "").Trim();
            if (name != "")
            {
                sql += $" WHERE First_Name LIKE '%{name}%' OR Last_Name LIKE '%{name}%' OR Middle_Initial LIKE '%{name}%'";
            }
            var tb = DBHR.getData(sql);

        }
    }
}