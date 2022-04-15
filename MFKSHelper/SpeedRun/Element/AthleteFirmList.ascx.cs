using DevExpress.Web;
using MFKSHelper.Classes.Main;
using MFKSHelper.Extensions;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteFirmList : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            gvAthletesFirmsList.DataBind();
            gvAthletesFirmsAssignment_List.DataBind();

            GridSetting(gvAthletesFirmsList);
            GridSetting(gvAthletesFirmsAssignment_List);
        }


        protected void dsFirms_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@RegionID"].Value = AthleteCardDto?.RegionID ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void dsAthletesFirmsList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        #region Методы

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = Global.CurrentUserFirmID;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        #endregion

        protected void dsAthletesFirmsList_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
        }

        protected void gvAthletes_Firms_List_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно добавлена", "Организации обучения", ToasterMessageType.Success);
        }

        protected void gvAthletes_Firms_List_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно изменена", "Организации обучения", ToasterMessageType.Success);
        }

        protected void gvAthletes_Firms_List_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно удалена", "Организации обучения", ToasterMessageType.Success);
        }

        protected void dsAthletesFirmsAssignmentList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void gvAthletesFirmsAssignment_List_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно изменена", "Организации командирования", ToasterMessageType.Success);
        }

        protected void gvAthletesFirmsAssignment_List_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            bool isContain = new[] { ColumnCommandButtonType.Delete, ColumnCommandButtonType.Edit }.Contains(e.ButtonType);

            if (!isContain)
                return;

            var firmID_To = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "FirmID"));
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

        private void GridSetting(ASPxGridView grid)
        {
            if (grid.Toolbars.Any() && grid.Toolbars[0].GetItem("btAdd") != null)
            {
                grid.Toolbars[0].GetItem("btAdd").Visible = AthleteCardDto?.IsEditable ?? false;
            }

            grid.Columns["CommandColum"].Visible = AthleteCardDto?.IsEditable ?? false;
            grid.ExpandAll();
        }

        public void Refresh()
        {
            gvAthletesFirmsAssignment_List.DataBind();
            gvAthletesFirmsList.DataBind();
        }
    }
}