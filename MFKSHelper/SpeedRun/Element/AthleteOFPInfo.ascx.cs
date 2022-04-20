using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using MFKSHelper.Extensions;
using MFKSHelper.Classes.Main;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteOFPInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        public string LastDate
        {
            get
            {
                return Convert.ToString(ViewState["LastDate"]);
            }
            set
            {
                ViewState["LastDate"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SetEditEnabled();
        }

        public void Refresh()
        {
            gvAthletes_performance_card.DataBind();
            SetEditEnabled();
        }

        public void SetEditEnabled()
        {
            gvAthletes_performance_card.Toolbars[0].GetItem("btAdd").Visible = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance_card.Columns["CommandColum"].Visible = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance_card.ExpandAll();
            gvAthletes_performance_card.SettingsDataSecurity.AllowInsert = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance_card.SettingsDataSecurity.AllowDelete = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance_card.SettingsDataSecurity.AllowEdit = AthleteCardDto?.IsEditable ?? false;
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = Global.CurrentUserFirmID;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void gvAthletes_performance_card_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
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

        protected void gvAthletes_performance_card_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись добавлена", "Общефизическая подготовка", ToasterMessageType.Success);
        }

        protected void gvAthletes_performance_card_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись изменена", "Общефизическая подготовка", ToasterMessageType.Success);
        }

        protected void gvAthletes_performance_card_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись удалена", "Общефизическая подготовка", ToasterMessageType.Success);
        }

        protected void dsAthletes_performance_card_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            ASPxComboBox cbPeriods = gvAthletes_performance_card.Toolbars.FindByName("Main").Items.FindByName("tbbtPeriodFilter").FindControl("cbPeriods") as ASPxComboBox;

            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@OnlyCurrentPeriod"].Value = cbPeriods.Value;
            e.Command.Parameters["@KindOfSportID"].Value = AthleteCardDto?.KindOfSportIDFilter ?? 0;
        }

        protected void dsFirms_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@RegionID"].Value = AthleteCardDto?.RegionID ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void cbKindOfSportList_Validation(object sender, ValidationEventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            if (gvAthletes_performance_card.IsNewRowEditing && !gvAthletes_performance_card.IsEditing && combo.SelectedItem == null)
                e.IsValid = false;
            e.ErrorText = "Обязательное поле";
        }

        protected void cbKindOfSportList_DataBound(object sender, EventArgs e)
        {
            var cmb = sender as ASPxComboBox;
            GridViewEditItemTemplateContainer container = cmb.NamingContainer as GridViewEditItemTemplateContainer;

            if (!container.Grid.IsNewRowEditing)
            {
                if (cmb.Value.ToString() == cmb.Text) cmb.Text = "Текущий вид спорта отсутствует в списке доступных у спортсмена. Выберите из доступных...";
            }
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void dsAthletes_performance_card_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@FirmID"].Value = Global.CurrentUserFirmID;
        }

        public string GetOfpLastDate(DateTime? lastDate)
        {
            if(AthleteCardDto == null)
            {
                return LastDate;
            }

            if (AthleteCardDto.AthleteStatisticsInfo.AthletesSpecialOlimpicsNorm != 0) { 
                LastDate = "Статистика берется из контрольных нормативов";
                return "Статистика берется из контрольных нормативов"; 
            }

            if (lastDate == null) 
            {
                LastDate = "необходимо внести данные";
                return "необходимо внести данные"; 
            }

            if (DateTime.Today > lastDate.Value.Date) { 
                LastDate = "обновите данные";
                return "обновите данные"; 
            }

            var total = 365 - (lastDate.Value.Date - DateTime.Today).TotalDays;
            
            LastDate = string.Format("Осталось: {0} дней", total);
            return string.Format("Осталось: {0} дней", total);
        }
    }
}