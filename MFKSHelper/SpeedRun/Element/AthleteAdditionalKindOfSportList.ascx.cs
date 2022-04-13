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
    public partial class AthleteAdditionalKindOfSportList : System.Web.UI.UserControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GridSetting(gvAthleteAdditionKindOfSport);
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@Lang"].Value = "Rus";
        }

        protected void dsAthleteKindOfSportList_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@KindOfSportID"].Value = gvAthleteAdditionKindOfSport.GetEditFormTemplateValueID("KindOfSportID", "cbKindOfSportList");
        }
        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = 22;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void cbEditTemplate_Validation(object sender, ValidationEventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            if (gvAthleteAdditionKindOfSport.IsNewRowEditing && !gvAthleteAdditionKindOfSport.IsEditing && combo.SelectedItem == null)
                e.IsValid = false;
            e.ErrorText = "Обязательное поле";
        }

        protected void dsAthleteKindOfSportListForAdding_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@Lang"].Value = "Rus";
        }

        protected void dsAthleteKindOfSportList_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
        }

        protected void gvAthleteAdditionKindOfSport_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно добавлена", "Дополнительные виды спорта", ToasterMessageType.Success);
        }

        protected void gvAthleteAdditionKindOfSport_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись успешно удалена", "Дополнительные виды спорта", ToasterMessageType.Success);
        }

        #region Методы

        private void GridSetting(ASPxGridView grid)
        {
            grid.Toolbars[0].GetItem("btAdd").Visible = AthleteCardDto?.IsEditable ?? false;
            grid.Columns["CommandColum"].Visible = AthleteCardDto?.IsEditable ?? false;
            grid.ExpandAll();
        }

        //todo: Необходимо настроить обновление других компонентов при обновлении списка видов спорта

        #endregion
    }
}