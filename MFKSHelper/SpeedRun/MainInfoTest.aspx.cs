using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun
{
    public partial class MainInfoTest : System.Web.UI.Page
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
            ucAthleteMainInfo.KindOfSportChanged();
            var athlID = ucAthleteMainInfo.AthleteID;
            var kndID = ucAthleteMainInfo.KindOfSportIDFilter;


            AthleteCardDto = new AthleteCardDto()
            {
                AthleteID = athlID,
                FirmID = 22,
                KindOfSportIDFilter = kndID,
                RegionID = 1,
                IsEditable = true
            };
            ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
            ucAthleteAdditionalKindOfSportList.AthleteCardDto = AthleteCardDto;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "refreshAthlete":
                    //ucAthleteMainInfo.AtheleteChanged();

                    //var athleteID = ucAthleteMainInfo.AthleteID;
                    //var kindOfSportIDFilter = ucAthleteMainInfo.KindOfSportIDFilter;

                    //AthleteCardDto = new AthleteCardDto()
                    //{
                    //    AthleteID = athleteID,
                    //    FirmID = 22,
                    //    KindOfSportIDFilter = kindOfSportIDFilter,
                    //    RegionID = 1,
                    //    IsEditable = true
                    //};
                    //ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
                    //ucAthleteTrainerList.Refresh();

                    break;

                case "refreshKindOfSport":

                    //ucAthleteMainInfo.KindOfSportChanged();

                    //athleteID = ucAthleteMainInfo.AthleteID;
                    //kindOfSportIDFilter = ucAthleteMainInfo.KindOfSportIDFilter;

                    //AthleteCardDto = new AthleteCardDto()
                    //{
                    //    AthleteID = athleteID,
                    //    FirmID = 22,
                    //    KindOfSportIDFilter = kindOfSportIDFilter,
                    //    RegionID = 1,
                    //    IsEditable = true
                    //};

                    //ucAthleteTrainerList.AthleteCardDto = AthleteCardDto;
                    //ucAthleteTrainerList.Refresh();

                    break;
            }
        }
    }
}