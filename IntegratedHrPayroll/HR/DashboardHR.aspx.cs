using Microsoft.Ajax.Utilities;
using MySqlX.XDevAPI.Relational;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace IntegratedHrPayroll.HR
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            controller.loadDashboardPage(this);
        }
    }
}