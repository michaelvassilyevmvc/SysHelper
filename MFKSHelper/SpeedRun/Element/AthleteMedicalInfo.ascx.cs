using DevExpress.Web;
using MFKSHelper.Classes.Main;
using MFKSHelper.Extensions;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteMedicalInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            SetEditEnabled();
        }

        protected void gvAthletes_medical_card_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно добавлена", "Медицинская карточка", ToasterMessageType.Success);
        }

        protected void gvAthletes_medical_card_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно изменена", "Медицинская карточка", ToasterMessageType.Success);
        }

        protected void gvAthletes_medical_card_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно удалена", "Медицинская карточка", ToasterMessageType.Success);
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = 22;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        public void Refresh()
        {
            gvAthletes_medical_card.DataBind();
        }

        public void SetEditEnabled()
        {
            gvAthletes_medical_card.SettingsDataSecurity.AllowInsert = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_medical_card.SettingsDataSecurity.AllowDelete = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_medical_card.SettingsDataSecurity.AllowEdit = AthleteCardDto?.IsEditable ?? false;
        }

        protected void gvAthletes_medical_card_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            bool isContain = new[] { ColumnCommandButtonType.Delete, ColumnCommandButtonType.Edit }.Contains(e.ButtonType);

            if (!isContain)
                return;

            var firmID_To = AthleteCardDto?.AthleteInfo?.FirmID ?? 0;
            var firmID_From = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "FirmID"));
            try
            {
                e.Visible = (Global.CurrentUserFirmID == firmID_To || Global.CurrentUserFirmID == firmID_From);
            }
            catch (InvalidCastException Ex)
            {
                string error = Ex.Message;
            }
            catch (OverflowException Ex)
            {
                string error = Ex.Message;
            }
            catch (FormatException Ex)
            {
                string error = Ex.Message;
            }
            catch (Exception Ex)
            {
                string error = Ex.Message;
            }
        }

        protected void dsAthletes_medical_card_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            ASPxComboBox cbPeriods = gvAthletes_medical_card.Toolbars.FindByName("Main").Items.FindByName("tbbtPeriodFilter").FindControl("cbPeriods") as ASPxComboBox;

            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
            e.Command.Parameters["@OnlyCurrentPeriod"].Value = cbPeriods.Value;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void dsAthletes_medical_card_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
            e.Command.Parameters["@FirmID"].Value = Global.CurrentUserFirmID;
        }
    }
}