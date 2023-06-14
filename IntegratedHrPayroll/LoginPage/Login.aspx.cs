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

        protected void login_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string query = "SELECT * FROM Personal WHERE Email = " + email + " AND Social_Security_Number = " + password;
            ConnectSqlServer sqlConn = new ConnectSqlServer();
            DataTable dt = sqlConn.getData(query);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("../Employee/profile.aspx");
            }
        }
    }
}