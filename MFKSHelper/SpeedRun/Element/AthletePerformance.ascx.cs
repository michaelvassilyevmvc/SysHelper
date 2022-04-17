using DevExpress.Web;
using MFKSHelper.Classes.Main;
using MFKSHelper.Extensions;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthletePerformance : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxSpinEdit cbYear = gvAthletes_performance.Toolbars.FindByName("Main").Items.FindByName("tbbtYear").FindControl("cbYear") as ASPxSpinEdit;
                cbYear.Number = DateTime.Now.Year;
                Refresh();
            }

            
            SetEditEnabled();
        }

       

        protected void dsAthletes_performance_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            ASPxSpinEdit cbYear = gvAthletes_performance.Toolbars.FindByName("Main").Items.FindByName("tbbtYear").FindControl("cbYear") as ASPxSpinEdit;

            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@KindOfSportId"].Value = AthleteCardDto?.KindOfSportIDFilter ?? 0;
            e.Command.Parameters["@Year"].Value = (cbYear == null) ? DateTime.Now.Year : cbYear.Value;
            e.Command.Parameters["@Lang"].Value = "Rus";
        }

        protected void gvAthletes_performance_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно добавлена", "Выступления на областных, республиканских и международных соревнованиях и учебно-тренировочных сборах, медицинских обследованиях", ToasterMessageType.Success);
        }

        protected void gvAthletes_performance_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно изменена", "Выступления на областных, республиканских и международных соревнованиях и учебно-тренировочных сборах, медицинских обследованиях", ToasterMessageType.Success);
        }

        protected void gvAthletes_performance_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно удалена", "Выступления на областных, республиканских и международных соревнованиях и учебно-тренировочных сборах, медицинских обследованиях", ToasterMessageType.Success);
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = Global.CurrentUserFirmID;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void gvAthletes_performance_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            bool isContain = new[] { ColumnCommandButtonType.Delete, ColumnCommandButtonType.Edit }.Contains(e.ButtonType);

            if (!isContain)
                return;

            var firmID_To = AthleteCardDto?.AthleteInfo?.FirmID ?? 0;
            var firmID_From = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "Edit_FirmID"));
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

        protected void dsBusiness_trip_organization_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@RegionID"].Value = Global.CurrentUserRegionID;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void gvAthletes_performance_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            e.Properties["cpAnotherFirmID"] = Global.AnotherRegionFirmID;
            e.Properties["cpAnotherFirmMessage"] = "При выборе данной организации будут удалены финансовые данные заполненые для данного спортсмена по текущему мероприятию. Также будет запрещено редактирование финансовых данных для текущей записи. Вы подтверждаете изменение?";
        }

        protected void dsEvents_CompletedSelect_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            ASPxSpinEdit cbYear = gvAthletes_performance.Toolbars.FindByName("Main").Items.FindByName("tbbtYear").FindControl("cbYear") as ASPxSpinEdit;

            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@FirmID"].Value = Global.CurrentUserFirmID;
            e.Command.Parameters["@Year"].Value = (cbYear == null) ? DateTime.Now.Year : cbYear.Value;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void ppcCustomModalEvents_CompletedSelect_WindowCallback(object source, PopupWindowCallbackArgs e)
        {
            ASPxPopupControl popup = source as ASPxPopupControl;
            switch (e.Parameter)
            {
                case "bindgrid":
                    ASPxGridView grid = popup.FindControl("gvEvents_CompletedSelect") as ASPxGridView;

                    grid.Selection.UnselectAll();
                    grid.PageIndex = 0;
                    grid.FilterExpression = "";

                    grid.DataBind();
                    grid.ExpandAll();

                    ASPxSpinEdit cbYear = gvAthletes_performance.Toolbars.FindByName("Main").Items.FindByName("tbbtYear").FindControl("cbYear") as ASPxSpinEdit;
                    lblYearByModal.Text = string.Format("Выбранный период: {0}", ((cbYear == null) ? DateTime.Now.Year.ToString() : cbYear.Value.ToString()));
                    break;
            }
        }

        protected void cbEventsCompletedList_Init(object sender, EventArgs e)
        {
            var cmb = sender as ASPxComboBox;
            GridViewEditItemTemplateContainer container = cmb.NamingContainer as GridViewEditItemTemplateContainer;

            if (!container.Grid.IsNewRowEditing)
            {
                string value = DataBinder.Eval(container.DataItem, "Events_CompletedListID").ToString();
                string text = DataBinder.Eval(container.DataItem, "Events_CompletedList_Name").ToString();
                cmb.Items.Add(text, value);
                cmb.SelectedIndex = 0;
            }
        }

        protected void cbEventsCompletedList_Validation(object sender, ValidationEventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            if (gvAthletes_performance.IsNewRowEditing && !gvAthletes_performance.IsEditing && combo.SelectedItem == null)
                e.IsValid = false;
            e.ErrorText = "Обязательное поле";
        }

        public void SetEditEnabled()
        {
            gvAthletes_performance.Toolbars[0].GetItem("btAdd").Visible = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance.Columns["CommandColum"].Visible = AthleteCardDto?.IsEditable ?? false;
            gvAthletes_performance.ExpandAll();
        }

        public void Refresh()
        {
            gvAthletes_performance.DataBind();
            SetEditEnabled();
        }

        protected void dsAthletes_performance_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
            e.Command.Parameters["@Events_CompletedListID"].Value = gvAthletes_performance.GetEditFormTemplateValueID("Events_CompletedListID", "cbEventsCompletedList");
            e.Command.Parameters["@Edit_FirmID"].Value = Global.CurrentUserFirmID;
        }

        protected void cbYear_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit seYear = sender as ASPxSpinEdit;
            seYear.Number = DateTime.Now.Year;
        }
    }
}