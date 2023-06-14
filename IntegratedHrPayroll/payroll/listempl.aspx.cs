using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace IntegratedHrPayroll.payroll
{
    public partial class listempl : System.Web.UI.Page
    {
        ConnectMysql2 connmysql = new ConnectMysql2();
        ConnectSqlServer consqlsv = new ConnectSqlServer();
        private void loaddashboard1()
        {
            
            string sql = "select Personal.Employee_ID, Personal.First_Name + ' '+ Personal.Middle_Initial +  ' ' + Personal.Last_Name as fullname,  Personal.Benefit_Plans, Personal.Ethnicity, Personal.Gender, Job_History.Department,Employment.Hire_Date from Personal,Job_History,Employment where Personal.Employee_ID = Job_History.Employee_ID and Job_History.End_Date is null and Personal.Employee_ID = Employment.Employee_ID";
            DataTable dt1 = consqlsv.getData(sql);
            dt1.Columns.Add("payrate", typeof(float));
            dt1.Columns.Add("paid_to_date", typeof(float));
            dt1.Columns.Add("tax_percentage", typeof(float));
            dt1.Columns.Add("payamount", typeof(Double));
            dt1.Columns.Add("total_income", typeof(Double));
            dt1.Columns.Add("Vacation_Days", typeof(int));

            foreach (DataRow row in dt1.Rows)
            {
                string Employee_Number = row[0].ToString();
                string sql2 = "select employee.Pay_Rate,employee.Paid_To_Date, pay_rates.Tax_Percentage, pay_rates.Pay_Amount from employee,pay_rates where employee.PayRates_id = pay_rates.idPay_Rates  and Employee_Number = " + Employee_Number;
                DataTable dt2 = connmysql.gettable(sql2);
                foreach (DataRow row2 in dt2.Rows)
                {
                    row["payrate"] = row2["Pay_Rate"];
                    row["paid_to_date"] = row2["Paid_To_Date"];
                    row["tax_percentage"] = row2["Tax_Percentage"];
                    row["payamount"] = row2["Pay_Amount"];
                    row["total_income"] = Math.Round((Convert.ToDouble(row["payamount"]) * (Convert.ToDouble(row["tax_percentage"]) - Convert.ToDouble(row["payrate"]))), 3);

                }

                string sql3 = "select Vacation_Days from employee where Employee_Number = " + Employee_Number;
                DataTable dt3 = connmysql.gettable(sql3);
                foreach (DataRow row3 in dt3.Rows)
                {
                    row["Vacation_Days"] = row3[0];
                  
                }
            }
            //lay du lieu tu bang employee
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddashboard1();
        }
    }
}
