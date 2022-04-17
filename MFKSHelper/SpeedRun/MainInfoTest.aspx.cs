using DevExpress.Web;
using MFKSHelper.Extensions;
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

            List<UserControl> ucList = new List<UserControl>
            {
                ucAthleteTrainerList,
                ucAthleteAdditionalKindOfSportList,
                ucAthleteFirmList,
                ucAthleteAdditionalInfo,
                ucAthleteContactInfo,
                ucAthleteAntroInfo,
                ucAthleteParentsInfo,
                ucAthletePerformance
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

                //AdditionalInfo
                case "edit_athlete_additinal_info":
                    AthelteAdditionalInfoEditStart();
                    break;
                case "save_athlete_additinal_info":
                    AthleteAdditionalInfoSave();
                    break;
                case "cancel_athlete_additinal_info":
                    AthleteAdditionalInfoCancel();
                    break;

                //ContactInfo
                case "edit_athlete_contact_info":
                    AthleteContactInfoEditStart();
                    break;
                case "save_athlete_contact_info":
                    AthleteContactInfoSave();
                    break;
                case "cancel_athlete_contact_info":
                    AthleteContactInfoCancel();
                    break;

                //AntroInfo
                case "edit_athlete_antro_info":
                    AthleteAntroInfoEditStart();
                    break;
                case "save_athlete_antro_info":
                    AthleteAntroInfoSave();
                    break;
                case "cancel_athlete_antro_info":
                    AthleteAntroInfoCancel();
                    break;
            }
        }

        #region Main
        private void PanelInfoRefresh()
        {
            AthleteCardDto.AthleteStatisticsInfo = AthleteStatisticsInfoRepository.Get(AthleteCardDto.AthleteID);
            List<ASPxRoundPanel> rpList = new List<ASPxRoundPanel>
            {
                rpMainInfo,
                rpTrainerList,
                rpFirmList,
                rpAdditionalInfo,
                rpAdditionalKindOfSportList,
                rpContactInfo,
                rpAntroInfo,
                rpParentInfo,
                rpPerformance
            };

            if (!IsPostBack)
                rpList.ForEach(x => { x.Collapsed = true; });

            pbAthleteCardPercent.Value = AthleteCardDto?.AthleteStatisticsInfo?.Total ?? 0;
            rpMainInfo.HeaderText = string.Format("Основная информация: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.Total ?? 0);
            rpTrainerList.HeaderText = string.Format("Список тренеров: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.SportInfo ?? 0);
            rpFirmList.HeaderText = string.Format("Список организаций: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.FirmList ?? 0);
            rpAdditionalInfo.HeaderText = string.Format("Дополнительная информация: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.AdditionalInfo ?? 0);
            rpContactInfo.HeaderText = string.Format("Контактная информация: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.PlaceOfPermanentResidence ?? 0);
            rpAntroInfo.HeaderText = string.Format("Антропометрические данные спортсмена: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.Anthropometric ?? 0);
            rpParentInfo.HeaderText = string.Format("Данные о родителях, опекунах, законных представителях: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.ParentsInfo ?? 0);
            rpPerformance.HeaderText = string.Format("Выступления на областных, республиканских и международных соревнованиях и учебно-тренировочных сборах: {0}%", AthleteCardDto?.AthleteStatisticsInfo?.AthletesPerformance ?? 0);
        }
        private void Refresh(bool IsResetFilter)
        {
            ucAthleteMainInfo.Refresh(IsResetFilter);

            if (IsResetFilter)
            {
                AthleteCardDto.KindOfSportIDFilter = 0;
            }

            List<UserControl> ucList = new List<UserControl>
            {
                ucAthleteTrainerList,
                ucAthleteAdditionalInfo,
                ucAthleteContactInfo,
                ucAthleteAntroInfo,
                ucAthleteParentsInfo,
                ucAthletePerformance
            };

            ucList.ForEach(x => { IAthleteCardControl cmp = (x as IAthleteCardControl); cmp.AthleteCardDto = AthleteCardDto; cmp.Refresh(); });
            ucAthleteAdditionalInfo.ShowEditMode(false);
            ucAthleteContactInfo.ShowEditMode(false);
            ucAthleteAntroInfo.ShowEditMode(false);

            PanelInfoRefresh();
        }

        #endregion


        #region AdditionalInfo

        private void AthelteAdditionalInfoEditStart()
        {
            ucAthleteAdditionalInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteAdditionalInfo.Refresh();
            ucAthleteAdditionalInfo.ShowEditMode(true);
        }

        private void AthleteAdditionalInfoSave()
        {
            try
            {
                ucAthleteAdditionalInfo.Save();
                PanelInfoRefresh();
                cbPanel.ShowToastr("Сохранение изменений", "Дополнительная информация", Classes.Main.ToasterMessageType.Success);
            }
            catch (Exception ex)
            {
                cbPanel.ShowToastr("Ошибка при сохранении. " + ex.Message, "Дополнительная информация", Classes.Main.ToasterMessageType.Error);
            }
        }
        
        private void AthleteAdditionalInfoCancel()
        {
            ucAthleteAdditionalInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteAdditionalInfo.Cancel();
            cbPanel.ShowToastr("Отмена изменений", "Дополнительная информация", Classes.Main.ToasterMessageType.Info);
        }

        #endregion

        #region ContactInfo

        private void AthleteContactInfoEditStart()
        {
            ucAthleteContactInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteContactInfo.Refresh();
            ucAthleteContactInfo.ShowEditMode(true);
        }

        private void AthleteContactInfoSave()
        {
            try
            {
                ucAthleteContactInfo.Save();
                PanelInfoRefresh();
                cbPanel.ShowToastr("Сохранение прошло успешно", "Контактная информация", Classes.Main.ToasterMessageType.Success);
            }
            catch (Exception ex)
            {
                cbPanel.ShowToastr("Ошибка при сохранении. " + ex.Message, "Контактная информация", Classes.Main.ToasterMessageType.Error);
            }
        }

        private void AthleteContactInfoCancel()
        {
            ucAthleteContactInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteContactInfo.Cancel();
            cbPanel.ShowToastr("Отмена изменений", "Контактная информация", Classes.Main.ToasterMessageType.Info);
        }

        #endregion

        #region AntroInfo
        private void AthleteAntroInfoEditStart()
        {
            ucAthleteAntroInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteAntroInfo.Refresh();
            ucAthleteAntroInfo.ShowEditMode(true);
        }

        private void AthleteAntroInfoSave()
        {
            try
            {
                ucAthleteAntroInfo.Save();
                PanelInfoRefresh();
                cbPanel.ShowToastr("Сохранение прошло успешно", "Антропометрические данные спортсмена", Classes.Main.ToasterMessageType.Success);
            }
            catch (Exception ex)
            {
                cbPanel.ShowToastr("Ошибка при сохранении. " + ex.Message, "Антропометрические данные спортсмена", Classes.Main.ToasterMessageType.Error);
            }
        }

        private void AthleteAntroInfoCancel()
        {
            ucAthleteAntroInfo.AthleteCardDto = AthleteCardDto;
            ucAthleteAntroInfo.Cancel();
            cbPanel.ShowToastr("Отмена изменений", "Контактная информация", Classes.Main.ToasterMessageType.Info);
        }
        #endregion


    }
}