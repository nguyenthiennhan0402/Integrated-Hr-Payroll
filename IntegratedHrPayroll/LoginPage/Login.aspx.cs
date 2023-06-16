using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.LoginPage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        ConnectSqlServer DBHR = new ConnectSqlServer();
        ConnectMysql DBPR = new ConnectMysql();

        protected void login_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string query = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password +"'";

            var dataset = DBPR.gettable(query);
            if(dataset.Tables.Count > 0 )
            {
                var table = dataset.Tables[0];

                if (table.Rows.Count > 0)
                {
                    string email = table.Rows[0]["email"] + "";
                    Session["email"] = email;
                    string sql = "select j.Division, j.employee_id " +
                                "from job_history as j " +
                                "inner join personal as p on j.employee_id = p.employee_id " +
                                "where p.email = '"+email+"' and j.End_Date is null";
                    var table2 = DBHR.getData(sql);
                    int row = table2.Rows.Count;
                    if(row>0)
                    {
                        string division = table2.Rows[0]["Division"]+"";
                        Session["UserId"] = table.Rows[0]["id"] + "";
                        Session["TypeUser"] = division + "";
                        if (division == "HR")
                        {
                            Response.Redirect("~/HR/dashboardHR.aspx");
                        }
                        else if (division == "Payroll")
                        {
                            Response.Redirect("~/payroll/dashboard.aspx");
                        }
                        else if (division == "Employee")
                        {
                            Response.Redirect("~/Employee/profile.aspx");
                        }
                    }
                }
            }
        }
    }
}