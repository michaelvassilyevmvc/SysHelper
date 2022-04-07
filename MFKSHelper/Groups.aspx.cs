using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper
{
    public partial class Groups : System.Web.UI.Page
    {
        private Int64 GroupID
        {
            get
            {
                Int64 result = 100001366;
                if (Request.QueryString["GroupId"] == null)
                    return result;
                Int64.TryParse(Request.QueryString["GroupId"], out result);
                return result;
            }
        }

        public int FirmID
        {
            get
            {
                return 28;
            }
        }

        public int KindsOfSportsID
        {
            get
            {
                return 11;
            }
        }

        public int ShowArchive
        {
            get
            {
                return hfAthletesProps.Contains("ShowArchive") ? Convert.ToInt32(hfAthletesProps["ShowArchive"]) : 0;
            }
            set
            {
                hfAthletesProps["ShowArchive"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var pst = IsPostBack;
            //gvGroupSelect.DataBind();
        }

        protected void dsLearning_groups_composition_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ID"].Value = GroupID;
            e.Command.Parameters["@ShowArchiveAthletes"].Value = ShowArchive;
        }

        protected void cbLearningGroupCompositionPanel_Callback(object sender, CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "GroupSelectShowModal":
                    hfAthletesProps["GroupSelectShowModal"] = true;
                    gvGroupSelect.DataBind();
                    gvGroupSelect.Selection.UnselectAll();
                    break;
            }
        }

        protected void hlTransfer_Init(object sender, EventArgs e)
        {
            ASPxHyperLink link = (sender as ASPxHyperLink);
            GridViewDataRowTemplateContainer container = link.NamingContainer as GridViewDataRowTemplateContainer;
            string AthleteID = container.Grid.GetRowValuesByKeyValue(container.KeyValue, "AthleteID").ToString();
            object DateToAsObject = container.Grid.GetRowValuesByKeyValue(container.KeyValue, "DateTo");
            if (DateToAsObject != null && (DateTime)DateToAsObject <= DateTime.Today)
            {
                link.Visible = false;
            }
            else
            {
                link.JSProperties["cpAthleteID"] = AthleteID;
                link.JSProperties["cpDateFrom"] = container.Grid.GetRowValuesByKeyValue(container.KeyValue, "DateFrom");
            }
        }


        #region Methods




        #endregion

        protected void dsGroupSelect_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@FirmID"].Value = FirmID;
            e.Command.Parameters["@KindsOfSportsID"].Value = KindsOfSportsID;
            e.Command.Parameters["@GroupID"].Value = GroupID;
        }
    }
}