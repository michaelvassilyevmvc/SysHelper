﻿using DevExpress.Web;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteTrainerList : System.Web.UI.UserControl
    {
        #region Свойства
        public int AthleteID { get; set; } = 100013808;
        public int FirmID { get; set; } = 22;
        #endregion

        #region События
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = 22;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
        }
        protected void dsAthleteTrainerList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
            e.Command.Parameters["@KindOfSportID"].Value = 0;
            e.Command.Parameters["@Lang"].Value = "Rus";
        }
        protected void cbEditTemplate_Validation(object sender, ValidationEventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            if (gvTrainerListByAthlete.IsNewRowEditing && !gvTrainerListByAthlete.IsEditing && combo.SelectedItem == null)
                e.IsValid = false;
            e.ErrorText = "Обязательное поле";
        }
        protected void dsAccessTrainersToAthlete_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
            e.Command.Parameters["@FirmID"].Value = 22;
            e.Command.Parameters["@RegionID"].Value = 1;
        }
        protected void cbTrainerList_Init(object sender, EventArgs e)
        {
            var cmb = sender as ASPxComboBox;
            GridViewEditItemTemplateContainer container = cmb.NamingContainer as GridViewEditItemTemplateContainer;

            if (!container.Grid.IsNewRowEditing)
            {
                string value = DataBinder.Eval(container.DataItem, "TrainerID").ToString();
                string text = DataBinder.Eval(container.DataItem, "FIO").ToString();
                cmb.Items.Add(text, value);
                cmb.SelectedIndex = 0;
            }
        }
        protected void ppcCustomModalSportInfoTrainerSelect_WindowCallback(object source, PopupWindowCallbackArgs e)
        {
            ASPxPopupControl popup = source as ASPxPopupControl;
            switch (e.Parameter)
            {
                case "bindgrid":
                    ASPxGridView grid = popup.FindControl("gvTrainersSelect") as ASPxGridView;
                    grid.Selection.UnselectAll();
                    grid.PageIndex = 0;
                    grid.FilterExpression = "";
                    var filterCombo = (grid.FindFilterCellTemplateControl(grid.Columns["KindOfSportID"] as GridViewColumn, "cbKindOfSportListFilter") as ASPxComboBox);
                    filterCombo.SelectedItem = null;
                    filterCombo.SelectedIndex = -1;
                    filterCombo.SelectedIndex = 0;

                    grid.DataBind();
                    break;
            }
        }
        protected void dsAthleteTrainerList_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@TrainerID"].Value = gvTrainerListByAthlete.GetEditFormTemplateValueID("TrainerID", "cbTrainerList");

        }
        protected void dsAthleteTrainerList_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteID;
            e.Command.Parameters["@TrainerID"].Value = gvTrainerListByAthlete.GetEditFormTemplateValueID("TrainerID", "cbTrainerList");
            e.Command.Parameters["@Edit_FirmID"].Value = FirmID;
        }

        #endregion
    }
}