using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteContactInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        private bool IsEditMode
        {
            get
            {
                if (ViewState["ContactInfoEdit"] != null)
                {
                    return Convert.ToBoolean(ViewState["ContactInfoEdit"]);
                }
                return false;
            }
            set
            {
                ViewState["ContactInfoEdit"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Refresh();
                ShowEditMode(false);
            }
        }

        public void Refresh()
        {
            var info = AthleteCardDto.AthleteInfo;

            tbPlace_of_permanent_residence.Text = info.Place_of_permanent_residence;
            tbContact_phone_number.Text = info.Contact_phone_number;
            tbHome_phone_number.Text = info.Home_phone_number;
        }

        public void DataFromControls()
        {
            var info = AthleteCardDto.AthleteInfo;

            info.Place_of_permanent_residence = tbPlace_of_permanent_residence.Text;
            info.Contact_phone_number = tbContact_phone_number.Text;
            info.Home_phone_number = tbHome_phone_number.Text;
        }

        public void ShowEditMode(bool isEditMode)
        {
            IsEditMode = isEditMode;
            bool isAllowEdit = IsEditMode && AthleteCardDto.IsEditable;
            btContactInfoStartEdit.ClientVisible = !IsEditMode && AthleteCardDto.IsEditable;
            btContactInfoSave.ClientVisible = isAllowEdit;
            btContactInfoCancel.ClientVisible = isAllowEdit;

            List<ASPxWebControl> wcList = new List<ASPxWebControl>
            {
                tbContact_phone_number,
                tbHome_phone_number,
                tbPlace_of_permanent_residence
            };

            wcList.ForEach(x => x.Enabled = isAllowEdit);
        }

        public void Save()
        {
            DataFromControls();
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
        }

        public void Cancel()
        {
            Refresh();
            ShowEditMode(false);
        }
    }
}