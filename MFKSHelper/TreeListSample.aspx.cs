using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper
{
    public partial class TreeListSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tlCompletedEventsList.DataBind();
        }

        protected void dsCompletedEventsList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@FirmID"].Value = 22;
            e.Command.Parameters["@YearStart"].Value = 2022;
            e.Command.Parameters["@YearEnd"].Value = 2022;
            e.Command.Parameters["@RegionID"].Value = 1;
        }
    }
}