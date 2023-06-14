using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.Employee
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            atagprofile.ServerClick += atag_Click;
            atagschedule.ServerClick += atag_Click;
            atagbenefit.ServerClick += atag_Click;
            atagnotification.ServerClick += atag_Click;
            if (IsPostBack) return;
        }

        protected void atag_Click(object sender, EventArgs e)
        {
            if((sender as HtmlAnchor).ID == "atagprofile")
                Response.Redirect("profile.aspx");
            else if((sender as HtmlAnchor).ID == "atagschedule")
                Response.Redirect("work-schedule.aspx");
            else if ((sender as HtmlAnchor).ID == "atagbenefit")
                Response.Redirect("account-benefit.aspx");
            else if ((sender as HtmlAnchor).ID == "atagnotification")
                Response.Redirect("notification.aspx");
        }
    }
}