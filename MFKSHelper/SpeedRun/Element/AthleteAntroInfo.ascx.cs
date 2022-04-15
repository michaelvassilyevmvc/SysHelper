using DevExpress.Web;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteAntroInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        private bool IsEditMode
        {
            get
            {
                if (ViewState["AntroInfoEdit"] != null)
                {
                    return Convert.ToBoolean(ViewState["AntroInfoEdit"]);
                }
                return false;
            }
            set
            {
                ViewState["AntroInfoEdit"] = value;
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

            tbAnthropometric_growth.Text = info.Anthropometric_growth;
            tbAnthropometric_weight.Text = info.Anthropometric_weight;
            tbAnthropometric_clothing_size.Text = info.Anthropometric_clothing_size;
            tbAnthropometric_shoe_size.Text = info.Anthropometric_shoe_size;
            tbAnthropometric_cap_size.Text = info.Anthropometric_cap_size;
        }

        public void DataFromControls()
        {
            var info = AthleteCardDto.AthleteInfo;

            info.Anthropometric_growth = tbAnthropometric_growth.Text;
            info.Anthropometric_weight = tbAnthropometric_weight.Text;
            info.Anthropometric_clothing_size = tbAnthropometric_clothing_size.Text;
            info.Anthropometric_shoe_size = tbAnthropometric_shoe_size.Text;
            info.Anthropometric_cap_size = tbAnthropometric_cap_size.Text;
        }

        public void ShowEditMode(bool isEditMode)
        {
            IsEditMode = isEditMode;
            bool isAllowEdit = IsEditMode && AthleteCardDto.IsEditable;
            btAntroInfoStartEdit.ClientVisible = !IsEditMode && AthleteCardDto.IsEditable;
            btAntroInfoSave.ClientVisible = isAllowEdit;
            btAntroInfoCancel.ClientVisible = isAllowEdit;

            List<ASPxWebControl> wcList = new List<ASPxWebControl>
            {
                tbAnthropometric_growth,
                tbAnthropometric_weight,
                tbAnthropometric_clothing_size,
                tbAnthropometric_shoe_size,
                tbAnthropometric_cap_size
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