using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.Athletes.Elements
{
    public partial class AthleteTrainerList : System.Web.UI.UserControl
    {
        private string CurrentCategoryID
        {
            get { return Session["CategoryID"] == null ? String.Empty : Session["CategoryID"].ToString(); }
            set { Session["CategoryID"] = value; }
        }
        public int AthleteID
        {
            get
            {
                return Convert.ToInt32(ViewState["athleteID"]);
            }
            set
            {
                ViewState["athleteID"] = value;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            gvAthleteTrainerList.ExpandAll();
        }

        protected void dsAthleteTrainerList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
        }

        public string DateTimePeriod(string str)
        {
            if (string.IsNullOrEmpty(str)) return "Настоящее время";

            return Convert.ToDateTime(str).ToShortDateString();
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = 22;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
        }
    }
}