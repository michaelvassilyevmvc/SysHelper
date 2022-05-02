using DevExpress.Web;
using MFKSHelper.Classes.Main;
using MFKSHelper.Extensions;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteSpecialNormsInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }
        public string LastDate
        {
            get
            {
                return Convert.ToString(ViewState["LastSpecialPerformDate"]);
            }
            set
            {
                ViewState["LastSpecialPerformDate"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Refresh();
            }

        }

        protected void dsAthletesKindsOfSport_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            ASPxComboBox cbPeriods = gvAthletesKindsOfSport.Toolbars.FindByName("Main").Items.FindByName("tbbtPeriodFilter").FindControl("cbPeriods") as ASPxComboBox;

            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@DateID"].Value = cbPeriods.Value;
        }

        protected void gvAthletesKindsOfSport_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись добавлена", "Контрольные нормы", ToasterMessageType.Success);
        }
        protected void gvAthletesKindsOfSport_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись изменена", "Контрольные нормы", ToasterMessageType.Success);
        }
        protected void gvAthletesKindsOfSport_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            grid.ShowToastr("Запись удалена", "Контрольные нормы", ToasterMessageType.Success);
        }

        protected void DataSource_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = string.Format("{0}", e.ErrorText);
        }

        protected void gvAthleteNorms_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            Session["NormSpecialNormsKindOfSportID"] = grid.GetMasterRowFieldValues("SpecialKindOfSportID");
            Session["Date"] = grid.GetMasterRowFieldValues("Date");
        }

        protected void gvAthletesKindsOfSport_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Session["OldDate"] = e.OldValues["Date"];
        }
        protected void gvAthletesKindsOfSport_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Session["SpecialKindOfSportID"] = e.Values["SpecialKindOfSportID"];
            Session["Date"] = e.Values["Date"];
        }

        protected void dsAthletesKindsOfSport_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;

            if (e.Command.Parameters.Contains("@RowID"))
            {
                e.Command.Parameters.RemoveAt("@RowID");
            }

            if (!e.Command.Parameters.Contains("@SpecialKindOfSportID"))
            {

                e.Command.Parameters.Add(new SqlParameter("@SpecialKindOfSportID", SqlDbType.BigInt) { Value = Session["SpecialKindOfSportID"] });
            }

            if (!e.Command.Parameters.Contains("@Date"))
            {
                e.Command.Parameters.Add(new SqlParameter("@Date", SqlDbType.Date) { Value = Session["Date"] });
            }

        }

        #region Методы

        public string GetLastDate()
        {
            DateTime? lastDate = AthleteCardDto?.AthleteInfo?.SpecialNormInfoLastDate;
            if (AthleteCardDto == null)
            {
                return LastDate;
            }

            

            if (lastDate == null)
            {
                LastDate = "необходимо внести данные";
                return "необходимо внести данные";
            }

            if (DateTime.Today > lastDate.Value.Date)
            {
                LastDate = "обновите данные";
                return "обновите данные";
            }

            var total = (lastDate.Value.Date - DateTime.Today).TotalDays;

            LastDate = string.Format("Осталось: {0} дней", total);
            return string.Format("Осталось: {0} дней", total);
        }

        public void SetEditEnabled()
        {
            gvAthletesKindsOfSport.Toolbars[0].GetItem("btAdd").Visible = AthleteCardDto?.IsEditable ?? false;
            gvAthletesKindsOfSport.Columns["CommandColum"].Visible = AthleteCardDto?.IsEditable ?? false;
            
            gvAthletesKindsOfSport.SettingsDataSecurity.AllowInsert = AthleteCardDto?.IsEditable ?? false;
            gvAthletesKindsOfSport.SettingsDataSecurity.AllowDelete = AthleteCardDto?.IsEditable ?? false;
            gvAthletesKindsOfSport.SettingsDataSecurity.AllowEdit = AthleteCardDto?.IsEditable ?? false;
        }

        public void Refresh()
        {
            SetEditEnabled();
            gvAthletesKindsOfSport.DataBind();
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = Global.CurrentUserFirmID;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }
        #endregion

        protected void dsAthleteNorms_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
        }

        protected void dsSpecialKindsOfSport_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        protected void dsSpecialNorms_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }
    }
}