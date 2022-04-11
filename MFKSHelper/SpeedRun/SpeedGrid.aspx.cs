using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun
{
    public partial class SpeedGrid : System.Web.UI.Page
    {
        public AthleteCardDto AthleteCardDto
        {
            get
            {
                if (ViewState["AthleteCardDto"] != null)
                {
                    return ViewState["AthleteCardDto"] as AthleteCardDto;
                }
                return null;
            }
            set
            {
                ViewState["AthleteCardDto"] = value;
            }
        }

        protected void Page_PreLoad(object sender, EventArgs e)
        {
           
                cbAthleteList.DataBind();
                cbAthleteKindOfSportList.DataBind();
                var athleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                var kindOfSportID = (cbAthleteKindOfSportList.SelectedItem != null) ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;

                AthleteCardDto = new AthleteCardDto()
                {
                    AthleteID = athleteID,
                    FirmID = 22,
                    KindOfSportIDFilter = kindOfSportID,
                    RegionID = 1,
                    IsEditable = true
                };
                ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
        }


        #region События
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    cbAthleteList.DataBind();

            //    var athleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : (cbAthleteKindOfSportList.Items.Count > 0) ? Convert.ToInt32(cbAthleteKindOfSportList.Items[0].Value) : 0;
            //    AthleteCardDto = new AthleteCardDto()
            //    {
            //        AthleteID = athleteID,
            //        FirmID = 22,
            //        KindOfSportIDFilter = 0,
            //        RegionID = 1,
            //        IsEditable = true
            //    };

            //    ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
            //    ucAthleteTrainerList.Refresh();
            //}

            if(!IsPostBack)
                ucAthleteTrainerList.Refresh();
        }

        #endregion

        protected void dsAthleteList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@FirmID"].Value = 22;
        }

        

        protected void cbPanel_Callback(object sender, CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "refreshAthlete":
                    //cbAthleteKindOfSportList.DataBind();
                    cbAthleteKindOfSportList.SelectedIndex = 0;
                    //AthleteCardDto.AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                    //AthleteCardDto.KindOfSportIDFilter = cbAthleteKindOfSportList.SelectedItem != null ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;
                    //ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
                    ucAthleteTrainerList.Refresh();
                break;
                case "refreshKindOfSport":
                    //cbAthleteKindOfSportList.DataBind();
                    ////ucAthleteTrainerList.AthleteCardDto.AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                    ////ucAthleteTrainerList.AthleteCardDto.KindOfSportIDFilter = cbAthleteKindOfSportList.SelectedItem != null ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;
                    //AthleteCardDto.AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                    //AthleteCardDto.KindOfSportIDFilter = cbAthleteKindOfSportList.SelectedItem != null ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;
                    //ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
                    ucAthleteTrainerList.Refresh();
                    break;
            }
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
        }
    }
}