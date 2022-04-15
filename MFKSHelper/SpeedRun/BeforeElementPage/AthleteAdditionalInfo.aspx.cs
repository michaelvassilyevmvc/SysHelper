using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.BeforeElementPage
{
    public partial class AthleteAdditionalInfo : System.Web.UI.Page
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
        public bool IsEditMode
        {
            get
            {
                if (ViewState["AdditionalInfoEdit"] != null)
                {
                    return Convert.ToBoolean(ViewState["AdditionalInfoEdit"]);
                }
                return false;
            }
            set
            {
                ViewState["AdditionalInfoEdit"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                AthleteCardDto = new AthleteCardDto()
                {
                    AthleteID = 100013808,
                    FirmID = Global.CurrentUserFirmID,
                    KindOfSportIDFilter = 0,
                    RegionID = Global.CurrentUserRegionID,
                    IsEditable = Global.CurrentUserEditable
                };

                AthleteCardDto.AthleteInfo = AthleteInfoRepository.Get(AthleteCardDto.AthleteID);
                AthleteCardDto.AthleteStatisticsInfo = AthleteStatisticsInfoRepository.Get(AthleteCardDto.AthleteID);

                Refresh();
                ShowEditMode(false);
            }
        }

        protected void dsAthletes_social_status_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        public void Refresh()
        {
            cbSocial_status.DataBind();

            var info = AthleteCardDto.AthleteInfo;


            if (cbSocial_status.Items.Any())
            {
                cbSocial_status.SelectedItem = cbSocial_status.Items.FirstOrDefault(x => (int)x.Value == info.SocialStatusID);
            }

            if (info.Passport_Date_of_issue.HasValue) tePassport_Date_of_issue.Value = info.Passport_Date_of_issue.Value;
            if (info.Identity_card_Date_of_issue.HasValue) teIdentity_card_Date_of_issue.Value = info.Identity_card_Date_of_issue.Value;
            if (info.BC_Date_of_issue.HasValue) teBC_Date_of_issue.Value = info.BC_Date_of_issue.Value;

            tbBirthplace.Text = info.Birthplace;
            tbEducation_info.Text = info.Education_info;
            tePassport_ID.Text = info.Passport_ID;
            tePassport_Issued_by.Text = info.Passport_Issued_by;
            teIdentity_card_ID.Text = info.Identity_card_ID;
            tbIdentity_card_Issued_by.Text = info.Identity_card_Issued_by;
            teBC_ID.Text = info.BC_ID;
            teBC_Issued_by.Text = info.BC_Issued_by;

        }

        private void DataFromControls()
        {
            var info = AthleteCardDto.AthleteInfo;

            info.SocialStatusID = (int)cbSocial_status.SelectedItem.Value;

            info.Passport_Date_of_issue = (DateTime?)tePassport_Date_of_issue.Value;
            info.Identity_card_Date_of_issue = (DateTime?)teIdentity_card_Date_of_issue.Value;
            info.BC_Date_of_issue = (DateTime?)teBC_Date_of_issue.Value;

            info.Birthplace = tbBirthplace.Text;
            info.Education_info = tbEducation_info.Text;
            info.Passport_ID = tePassport_ID.Text;
            info.Passport_Issued_by = tePassport_Issued_by.Text;
            info.Identity_card_ID = teIdentity_card_ID.Text;
            info.Identity_card_Issued_by = tbIdentity_card_Issued_by.Text;
            info.BC_ID = teBC_ID.Text;
            info.BC_Issued_by = teBC_Issued_by.Text;
        }

        private void ShowEditMode(bool isEditMode)
        {
            IsEditMode = isEditMode;
            bool isAllowEdit = IsEditMode && AthleteCardDto.IsEditable;
            btAdditionalInfoStartEdit.ClientVisible = !IsEditMode && AthleteCardDto.IsEditable;
            btAdditionalInfoCancel.ClientVisible = isAllowEdit;
            btAdditionalInfoSave.ClientVisible = isAllowEdit;

            List<ASPxWebControl> wcList = new List<ASPxWebControl>
            {
                tbBirthplace,
                tbEducation_info,
                cbSocial_status,
                tePassport_ID,
                tePassport_Date_of_issue,
                tePassport_Issued_by,
                teIdentity_card_ID,
                teIdentity_card_Date_of_issue,
                tbIdentity_card_Issued_by,
                teBC_ID,
                teBC_Date_of_issue,
                teBC_Issued_by
            };

            wcList.ForEach(x => x.Enabled = isAllowEdit);

        }

        protected void btAdditionalInfoStartEdit_Click(object sender, EventArgs e)
        {
            ShowEditMode(true);
        }

        protected void btAdditionalInfoSave_Click(object sender, EventArgs e)
        {
            DataFromControls();
            try
            {
                LogData logData = new LogData
                {
                    Log_IP = "",
                    Log_SessionID = this.Session.SessionID,
                    Log_Login = "stester",
                    Log_ClientID = Global.CurrentUserFirmID.ToString(),
                    Log_AuthorisationSessionID = null
                };
                AthleteInfoRepository.Save(AthleteCardDto.AthleteInfo, logData);
                ShowEditMode(false);
                //this.ShowToastr("Сохранение изменений", "Дополнительная информация", Classes.Main.ToasterMessageType.Success);
            }
            catch (Exception ex)
            {
                //this.ShowToastr("Ошибка при сохранении. "+ex.Message, "Дополнительная информация", Classes.Main.ToasterMessageType.Error);
            }
        }

        protected void btAdditionalInfoCancel_Click(object sender, EventArgs e)
        {
            AthleteCardDto = new AthleteCardDto()
            {
                AthleteID = 100013808,
                FirmID = Global.CurrentUserFirmID,
                KindOfSportIDFilter = 0,
                RegionID = Global.CurrentUserRegionID,
                IsEditable = Global.CurrentUserEditable
            };

            AthleteCardDto.AthleteInfo = AthleteInfoRepository.Get(AthleteCardDto.AthleteID);
            AthleteCardDto.AthleteStatisticsInfo = AthleteStatisticsInfoRepository.Get(AthleteCardDto.AthleteID);
            Refresh();
            ShowEditMode(false);
            //this.ShowToastr("Отмена изменений", "Дополнительная информация", Classes.Main.ToasterMessageType.Info);
        }
    }
}