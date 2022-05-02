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
    public partial class AthleteSpecialPerformanceCardInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public readonly string Caption = "Специальная физическая подготовка";
        public bool IsLangKAZ { get; set; } = false;
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
            if (!IsPostBack)
            {
                Refresh();
            }
        }

        //protected void gv_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        //{
        //    ASPxGridView grid = sender as ASPxGridView;
        //    grid.ShowToastr("Запись успешно добавлена", Caption, ToasterMessageType.Success);
        //}
        //protected void gv_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        //{
        //    ASPxGridView grid = sender as ASPxGridView;
        //    grid.ShowToastr("Запись успешно изменена", Caption, ToasterMessageType.Success);
        //}
        //protected void gv_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        //{
        //    ASPxGridView grid = sender as ASPxGridView;
        //    grid.ShowToastr("Запись успешно удалена", Caption, ToasterMessageType.Success);
        //}

        protected void dsAthletes_special_performance_card_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto?.AthleteID ?? 0;
            e.Command.Parameters["@KindOfSportID"].Value = AthleteCardDto?.KindOfSportIDFilter ?? 0;
            e.Command.Parameters["@Lang"].Value = Global.LangQuery;
        }

        #region Методы
        public void Refresh()
        {
            gvAthletes_special_performance_card.DataBind();
        }

        public string GetLastDate()
        {
            DateTime? lastDate = AthleteCardDto?.AthleteInfo?.SpecialPerformanceCardInfoLastDate;
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

        #endregion

        
    }
}