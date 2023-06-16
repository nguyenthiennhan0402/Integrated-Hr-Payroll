using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace IntegratedHrPayroll.Employee
{
    //công thức tính lương
    //    pay_amount: định mức phải trả theo chức vụ
    //    pay_to_date: số tiền đã trả cho đến hiện tại
    //    pay_rate: hệ số lương
    //    số tiền thực nhận: pay_amount * (pay_rate - tax_percentage)
    //    pay_last_year: tổng thu nhập trong năm ngoái
    public partial class account_benefit : System.Web.UI.Page
    {
        ConnectMysql connMysql = new ConnectMysql();
        ConnectSqlServer connSql = new ConnectSqlServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idEm = Session["UserId"] + "";
            if (idEm == "")
            {
                Response.Redirect("~/LoginPage/Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    loadChart();

                    loadInfo();
                }
            }
        }

        private void loadChart()
        {
           
            string sql = "select Employee_ID, First_Name + ' '+ Middle_Initial +  ' ' + Last_Name as fullname, Benefit_Plans, Ethnicity, Gender from Personal where Email ='" + Session["email"].ToString() + "'";
            DataTable dt1 = connSql.getData(sql);
            dt1.Columns.Add("payrate", typeof(float));
            dt1.Columns.Add("paid_to_date", typeof(float));
            dt1.Columns.Add("tax_percentage", typeof(float));
            dt1.Columns.Add("payamount", typeof(Double));
            dt1.Columns.Add("total_income", typeof(Double));


            foreach (DataRow row in dt1.Rows)
            {
                
                string Employee_Number = row[0].ToString();
                string sql2 = "select employee.Pay_Rate,employee.Paid_To_Date, pay_rates.Tax_Percentage, pay_rates.Pay_Amount from employee,pay_rates where employee.PayRates_id = pay_rates.idPay_Rates  and Employee_Number = " + Employee_Number;
                var ds = connMysql.gettable(sql2);
                DataTable dt2 = ds.Tables.Count > 0 ? ds.Tables[0] : null;
                foreach (DataRow row2 in dt2.Rows)
                {
                    row["payrate"] = row2["Pay_Rate"];
                    row["paid_to_date"] = row2["Paid_To_Date"];
                    row["tax_percentage"] = row2["Tax_Percentage"];
                    row["payamount"] = row2["Pay_Amount"];
                    row["total_income"] = Math.Round((Convert.ToDouble(row["payamount"]) * (Convert.ToDouble(row["tax_percentage"]) - Convert.ToDouble(row["payrate"]))), 3);

                    object[] data = new object[] {
                    new { label="Mức lương", value=row["payrate"]},
                    new { label="Số lần được nhận lương", value=row["paid_to_date"]},
                    new { label="Thuế (%)", value=row["tax_percentage"]},
                    new { label="Số Tiền Trả", value=row["payamount"]},
                    new { label="Lương Thực Tế", value = row["total_income"]}
                    };
                    Session["data"] = JsonConvert.SerializeObject(data);
                }
            }
        }

        private void loadInfo()
        {
            string sql = "select Employee_ID, First_Name + ' '+ Middle_Initial +  ' ' + Last_Name as fullname from Personal where Email = '" + Session["email"].ToString() + "'";
            string empID = Session["EmpID"].ToString();
            // Truy vấn dữ liệu từ cơ sở dữ liệu
            string query = "SELECT First_Name, Last_Name, SSN, Pay_Rate, Vacation_Days, Paid_To_Date, Paid_Last_Year " +
                           "FROM employee " +
                           "WHERE Employee_Number = " + empID;

            DataTable dt = connSql.getData(sql);
            DataSet dataSet = connMysql.gettable(query);

            if (dt.Rows.Count > 0 && dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                DataRow rowmy = dataSet.Tables[0].Rows[0];
                DataRow rowsql = dt.Rows[0];
                string employeeName = rowsql["fullname"].ToString();
                string ssn = rowmy["SSN"].ToString();
                string payRate = rowmy["Pay_Rate"].ToString();
                string vacationDays = rowmy["Vacation_Days"].ToString();
                string paidToDate = rowmy["Paid_To_Date"].ToString();
                string paidLastYear = rowmy["Paid_Last_Year"].ToString();

                // Hiển thị dữ liệu trên trang web
                employeeNameLabel.Text = employeeName;
                ssnLabel.Text = ssn;
                payRateLabel.Text = payRate;
                vacationDaysLabel.Text = vacationDays;
                paidToDateLabel.Text = paidToDate;
                paidLastYearLabel.Text = paidLastYear;
            }
        }
    }
}