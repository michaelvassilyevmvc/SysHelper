using MFKSHelper.SpeedRun.Models;
using System;
using DevExpress.Web;
using System.Collections.Generic;

namespace MFKSHelper.SpeedRun.BeforeElementPage
{
    public partial class AthleteContactInfo : System.Web.UI.Page
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

        #region Методы

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
            IsEditMode = IsEditMode;
            bool isAllowEdit = IsEditMode && AthleteCardDto.IsEditable;
            btContactInfoStartEdit.ClientVisible = !IsEditMode && AthleteCardDto.IsEditable;
            btContactInfoStartEdit.ClientVisible = isAllowEdit;
            btContactInfoStartEdit.ClientVisible = isAllowEdit;

            List<ASPxWebControl> wcList = new List<ASPxWebControl>
            {
                tbContact_phone_number,
                tbHome_phone_number,
                tbPlace_of_permanent_residence
            };

            wcList.ForEach(x => x.Enabled = isAllowEdit);
        }

        #endregion
    }
}