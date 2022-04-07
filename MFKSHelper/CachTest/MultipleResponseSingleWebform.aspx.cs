using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.CachTest
{
    public partial class MultipleResponseSingleWebform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }

        protected void cbKindOfSport_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvAthletes.DataBind();
        }

        protected void dsAthletes_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@KindOfSportID"].Value = cbKindOfSport.SelectedItem.Value;
        }
    }
}