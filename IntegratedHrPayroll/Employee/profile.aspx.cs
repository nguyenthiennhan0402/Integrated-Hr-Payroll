using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.Employee.aspx
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT P.First_Name, P.Last_Name, P.Middle_Initial, P.Gender, JH.Job_Title, JH.Department, P.Email, P.Phone_Number, P.Address1 FROM Personal P INNER JOIN Job_History JH ON P.Employee_ID = JH.Employee_ID WHERE P.Employee_ID = 1001";

                ConnectSqlServer sqlConn = new ConnectSqlServer();
                DataTable dt = sqlConn.getData(query);

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    txtName.Text = row["First_Name"].ToString() + " " + row["Last_Name"].ToString() + " " + row["Middle_Initial"].ToString();
                    if (row["Gender"].ToString() == "True")
                    {
                        txtGender.Text = "Male";
                    }
                    else
                    {
                        txtGender.Text = "Female";
                    }
                    txtPosition.Text = row["Job_Title"].ToString();
                    txtDepartment.Text = row["Department"].ToString();
                    txtEmail.Text = row["Email"].ToString();
                    txtPhoneNumber.Text = row["Phone_Number"].ToString();
                    txtAddress.Text = row["Address1"].ToString();
                }
            }
        }

        protected void update_click(object sender, EventArgs e)
        {
            string employeeID = "1001";
            string name = txtName.Text;
            string[] nameParts = name.Split(' ');
            string firstName = nameParts[0];
            string lastName = nameParts[1];
            string middleInitial = string.Join(" ", nameParts.Skip(2));
            string gender = txtGender.Text == "Male" ? "1" : "0";
            string position = txtPosition.Text;
            string department = txtDepartment.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string address = txtAddress.Text;

            string updatePersonalQuery = string.Format("UPDATE Personal SET First_Name = '{0}', Last_Name = '{1}', Middle_Initial = '{2}', Gender = '{3}', Email = '{4}', Phone_Number = '{5}', Address1 = '{6}' WHERE Employee_ID = {7}", firstName, lastName, middleInitial, gender, email, phoneNumber, address, employeeID);
            string updateJobHistoryQuery = string.Format("UPDATE Job_History SET Job_Title = '{0}', Department = '{1}' WHERE Employee_ID = {2}", position, department, employeeID);

            ConnectSqlServer sqlConn = new ConnectSqlServer();
            int rowsAffectedPersonal = sqlConn.UpdateData(updatePersonalQuery);
            int rowsAffectedJobHistory = sqlConn.UpdateData(updateJobHistoryQuery);
            if (rowsAffectedPersonal > 0 && rowsAffectedJobHistory > 0)
            {
                lbShow.Text = "Update Successful!";
            }
            else
            {
                lbShow.Text = "Update Failed!";
            }
        }

    }
}