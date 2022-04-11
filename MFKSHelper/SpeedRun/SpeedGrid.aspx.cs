using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun
{
    public partial class SpeedGrid : System.Web.UI.Page
    {
        


        #region События
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                var athleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                AthleteCardDto athleteCardDto = new AthleteCardDto()
                {
                    AthleteID = athleteID,
                    FirmID = 22,
                    KindOfSportIDFilter = 0,
                    RegionID = 1
                };

                ucAthleteTrainerList.AthleteCardDto = athleteCardDto;
            }
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
                case "refresh":
                    ucAthleteTrainerList.AthleteCardDto.AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
                    ucAthleteTrainerList.Refresh();
                break;
            }
        }
    }
}