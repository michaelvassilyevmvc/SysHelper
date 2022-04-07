using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using MFKSHelper.Models.Dto;

namespace MFKSHelper
{
    public partial class AdditionalSportTest : System.Web.UI.Page
    {
        List<AthleteAdditionalSportDto> athlAddSportList;
        List<KindOfSportDto> kindOfSportList = new List<KindOfSportDto>();

        protected void Page_Load(object sender, EventArgs e)
        {
            athlAddSportList = Repository.Repository.GetAthletesAdditionalSport().Where(x=>x.AthleteId == 100013773).ToList();
            kindOfSportList = Repository.Repository.GetKindOfSportListByCatalogs();
            gvAthleteAdditionKindOfSport.DataBind();
        }

        protected void gvAthleteAdditionKindOfSport_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            var result = from a in athlAddSportList
                         join k in kindOfSportList on a.KindOfSportId equals k.ID
                         select new
                         {
                             ID = a.ID,
                             Name = k.NameRus,
                             KindOfSportID = k.ID
                         };

            grid.DataSource = result;
        }

        protected void cbKindOfSportList_DataBinding(object sender, EventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            var tmp = athlAddSportList.Select(x => x.KindOfSportId);

            combo.DataSource = kindOfSportList.Where(x => !athlAddSportList.Any(a=> a.KindOfSportId == x.ID)).Select(x=>x.NameRus).ToList();
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "";
            e.Command.Parameters["@Log_ClientID"].Value = 20;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

       
    }
}