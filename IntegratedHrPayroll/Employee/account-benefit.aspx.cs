using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConnectMysql mysql = new ConnectMysql();
                int empID = 1001;
                // Truy vấn dữ liệu từ cơ sở dữ liệu
                string query = "SELECT First_Name, Last_Name, SSN, Pay_Rate, Vacation_Days, Paid_To_Date, Paid_Last_Year " +
                               "FROM employee " +
                               "WHERE Employee_Number = " + empID; 

                DataSet dataSet = mysql.gettable(query);

                if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                {
                    DataRow row = dataSet.Tables[0].Rows[0];

                    string employeeName = row["First_Name"].ToString() + " " + row["Last_Name"].ToString();
                    string ssn = row["SSN"].ToString();
                    string payRate = row["Pay_Rate"].ToString();
                    string vacationDays = row["Vacation_Days"].ToString();
                    string paidToDate = row["Paid_To_Date"].ToString();
                    string paidLastYear = row["Paid_Last_Year"].ToString();

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
}