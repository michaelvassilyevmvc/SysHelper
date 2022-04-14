using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;


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
            ucAthleteMainInfo.Refresh(false);
            var athlID = ucAthleteMainInfo.AthleteID;
            var kndID = ucAthleteMainInfo.KindOfSportIDFilter;

            AthleteCardDto = new AthleteCardDto()
            {
                AthleteID = athlID,
                FirmID = Global.CurrentUserFirmID,
                KindOfSportIDFilter = kndID,
                RegionID = Global.CurrentUserRegionID,
                IsEditable = Global.CurrentUserEditable                
            };

            AthleteCardDto.AthleteInfo = AthleteInfoRepository.Get(AthleteCardDto.AthleteID);
            AthleteCardDto.AthleteStatisticsInfo = AthleteStatisticsInfoRepository.Get(AthleteCardDto.AthleteID);

            List<UserControl> ucList = new List<UserControl>
            {
                ucAthleteTrainerList,
                ucAthleteAdditionalKindOfSportList,
                ucAthleteFirmList
            };

            ucList.ForEach(x => (x as IAthleteCardControl).AthleteCardDto = AthleteCardDto);

            PanelInfoRefresh();
        }




        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "refresh":
                case "refreshAthlete":
                    Refresh(true);
                    break;                
                case "refreshKindOfSport":
                    Refresh(false);
                    break;
            }
        }

        public void Refresh(bool IsResetFilter)
        {
            ucAthleteMainInfo.Refresh(IsResetFilter);

            if (IsResetFilter)
            {
                AthleteCardDto.KindOfSportIDFilter = 0;
            }

            AthleteCardDto.AthleteStatisticsInfo = AthleteStatisticsInfoRepository.Get(AthleteCardDto.AthleteID);

            List<UserControl> ucList = new List<UserControl>
                    {
                        ucAthleteTrainerList
                    };

            ucList.ForEach(x => { IAthleteCardControl cmp = (x as IAthleteCardControl); cmp.AthleteCardDto = AthleteCardDto; cmp.Refresh(); });

            PanelInfoRefresh();
        }

        

        private void PanelInfoRefresh()
        {
            pbAthleteCardPercent.Value = AthleteCardDto?.AthleteStatisticsInfo?.Total ?? 0;
            rpMainInfo.HeaderText = string.Format("Основная информация: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.Total ?? 0);
            rpTrainerList.HeaderText = string.Format("Список тренеров: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.SportInfo ?? 0);
            rpFirmList.HeaderText = string.Format("Список организаций: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.FirmList ?? 0);
        }
    }
}