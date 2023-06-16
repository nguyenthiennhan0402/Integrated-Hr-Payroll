using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace IntegratedHrPayroll.Employee.route
{
    public class web
    {
        public static void initRoute()
        {
            RouteTable.Routes.MapPageRoute("profile", "", "~/profile.aspx");
            RouteTable.Routes.MapPageRoute("work-schedule", "", "~/work-schedule.aspx");
            RouteTable.Routes.MapPageRoute("account-benefit", "", "~/account-benefit.aspx");
        }
    }
}