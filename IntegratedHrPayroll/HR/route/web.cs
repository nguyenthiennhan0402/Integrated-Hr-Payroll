using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace IntegratedHrPayroll.HR
{
    public class web
    {
        public static void initRoute()
        {
            RouteTable.Routes.MapPageRoute("DashboardHR", "", "~/DashboardHR.aspx");
            RouteTable.Routes.MapPageRoute("EmployeeHR", "{name}", "~/EmployeeHR.aspx");
            RouteTable.Routes.MapPageRoute("WarningHR", "", "~/DashboardHR.aspx");
        }
    }
}