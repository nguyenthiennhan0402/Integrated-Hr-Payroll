using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.Employee.aspx
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idEm = Session["UserId"] + "";
            if (idEm == "")
            {
                Response.Redirect("~/LoginPage/Login.aspx");
            }
            else
            {
                string email = Session["email"] + "";
                if (!IsPostBack)
                {
                    string querySQL = "SELECT p.First_Name, p.Last_Name, p.Middle_Initial, Case When p.Gender = 0 " +
                        " then 'Female' when p.Gender=1 then 'Male' end as Gender, p.Employee_ID, j.Job_Title, " +
                        "j.Department, p.Address1, p.City, p.State, p.Ethnicity, p.Email, p.Phone_Number " +
                        "FROM Personal p INNER JOIN Job_History j ON p.Employee_ID = j.Employee_ID Where p.Email = '" +
                        email + "' and j.End_Date is null";
                    string queryMySQL = "select e.SSN from employee e where e.idEmployee = " + idEm;

                    ConnectSqlServer DBHR = new ConnectSqlServer();
                    DataTable table = DBHR.getData(querySQL);

                    ConnectMysql DBPR = new ConnectMysql();
                    DataSet dt = DBPR.gettable(queryMySQL);

                    if (table.Rows.Count > 0 && dt.Tables.Count > 0 && dt.Tables[0].Rows.Count > 0)
                    {
                        DataRow hrrow = table.Rows[0];
                        DataRow prrow = dt.Tables[0].Rows[0];
                        txtName.Text = hrrow["First_Name"] + " " + hrrow["Last_Name"] + " " + hrrow["Middle_Initial"];
                        txtGender.Text = hrrow["Gender"].ToString();
                        txtEmpNum.Text = hrrow["Employee_ID"].ToString();
                        Session["EmpID"] = hrrow["Employee_ID"].ToString();
                        txtSsn.Text = prrow["SSN"].ToString();
                        txtPos.Text = hrrow["Job_Title"].ToString();
                        txtDep.Text = hrrow["Department"].ToString();
                        txtAddress.Text = hrrow["Address1"] + ", " + hrrow["City"] + ", " + hrrow["State"];
                        txtEthnicity.Text = hrrow["Ethnicity"].ToString();
                        txtEmail.Text = hrrow["Email"].ToString();
                        txtPhone.Text = hrrow["Phone_Number"].ToString();
                    }
                }
            }
        }

        protected void update_click(object sender, EventArgs e)
        {
            string empID = Session["UserId"] + "";
            string name = txtName.Text;
            string[] nameParts = name.Split(' ');
            string firstName = nameParts[0];
            string lastName = nameParts[0];
            string middle = string.Join(" ", nameParts.Skip(2));
            string mail = txtEmail.Text;
            string phone = txtPhone.Text;
            string empnum = txtEmpNum.Text;
            string upSql = string.Format("UPDATE Personal SET First_Name = '{0}', Last_Name = '{1}', Middle_Initial = '{2}', Email = '{3}', Phone_Number = '{4}' WHERE Employee_ID = {5}", firstName, lastName, middle, mail, phone, empnum);
            string upMysql = string.Format("UPDATE users set email = '{0}' where id = '{1}'", mail, empID);

            ConnectSqlServer sqlCon = new ConnectSqlServer();
            int rowsAffectedSql = sqlCon.UpdateData(upSql);

            ConnectMysql mysqlCon = new ConnectMysql();
            int rowsAffectedMySql = mysqlCon.UpdateData(upMysql);
            if (rowsAffectedMySql > 0 && rowsAffectedSql > 0)
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