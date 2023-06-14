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
    public partial class work_schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string employeeId = "1001"; 

                ConnectSqlServer sqlConn = new ConnectSqlServer();

                string query = "SELECT Start_Date, End_Date, Job_Title, Department, Location, Supervisor " +
                               "FROM Job_History " +
                               "WHERE Employee_ID = @EmployeeID";

                DataTable dataTable = sqlConn.getDataWithParam(query, new SqlParameter("@EmployeeID", employeeId));

                repeaterWorkSchedule.DataSource = dataTable;
                repeaterWorkSchedule.DataBind();
            }
        }
    }
}