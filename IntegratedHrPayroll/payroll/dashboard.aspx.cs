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
    public partial class dashboard : System.Web.UI.Page
    {

        ConnectMysql2 connmysql = new ConnectMysql2();
        ConnectSqlServer consqlsv = new ConnectSqlServer();
        private void loaddashboard1()
        {
            string sql = "select Employee_ID, First_Name + ' '+ Middle_Initial +  ' ' + Last_Name as fullname, Benefit_Plans, Ethnicity, Gender from Personal where Benefit_Plans = 1";
            DataTable dt1 = consqlsv.getData(sql);
            dt1.Columns.Add("payrate", typeof(float));
            dt1.Columns.Add("paid_to_date", typeof(float));
            dt1.Columns.Add("tax_percentage", typeof(float));
            dt1.Columns.Add("payamount", typeof(Double));
            dt1.Columns.Add("total_income", typeof(Double));


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
                    //row["total_income"] = (double) row2[3] * ((double)row2[0] - (double)row2[2]);
                    //row[10] = (double)row[9] * ((double)row[6] - (double)row[8]);
                }
            }
            //lay du lieu tu bang employee
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        private void loaddashboard2()
        {
            //load all employee
            string sql = "select Employee_ID, First_Name + ' '+ Middle_Initial +  ' ' + Last_Name as fullname, Benefit_Plans, Ethnicity, Gender from Personal";
            DataTable dt1 = consqlsv.getData(sql);
            dt1.Columns.Add("payrate", typeof(float));
            dt1.Columns.Add("paid_to_date", typeof(float));
            dt1.Columns.Add("tax_percentage", typeof(float));
            dt1.Columns.Add("payamount", typeof(Double));
            dt1.Columns.Add("total_income", typeof(Double));


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
                    //row["total_income"] = (double) row2[3] * ((double)row2[0] - (double)row2[2]);
                    //row[10] = (double)row[9] * ((double)row[6] - (double)row[8]);
                }
            }
            ///////////////////
            string sql3 = "select Benefit_Plan_ID,Plan_Name from Benefit_Plans";
            DataTable dt3 = consqlsv.getData(sql3);
            dt3.Columns.Add("total_income", typeof(Double));
            foreach (DataRow row in dt3.Rows)
            {
                string Benefit_Plan_ID = row[0].ToString();
                double totalincome = 0;
                //roww 1 duyet bang benefitplan row 2 duyệt bảng tổng số nhân viên để tính tổng lợi nhuận
                foreach (DataRow row2 in dt1.Rows)
                {
                    double income = 0;
                    if (row2["Benefit_Plans"].ToString().Equals(Benefit_Plan_ID))
                    {
                        if(row2["total_income"].ToString().Equals(""))
                                {
                                     income = 0;
                                }    
                        else
                                {
                                    income = Convert.ToDouble(row2["total_income"]);
                                }
                    }
                    totalincome += income;
                }
                row["total_income"] = totalincome.ToString();

            }
            GridView2.DataSource = dt3;
            GridView2.DataBind();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddashboard1();
            //lay du lieu tu bang personal
            loaddashboard2();

        }


    }
}
