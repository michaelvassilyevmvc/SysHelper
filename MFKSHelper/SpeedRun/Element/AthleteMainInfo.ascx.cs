﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteMainInfo : System.Web.UI.UserControl
    {
        public int AthleteID { get; set; }
        public int KindOfSportIDFilter { get; set; }

        protected void Page_PreLoad(object sender, EventArgs e)
        {

            
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsAthleteList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@FirmID"].Value = 22;
        }

        protected void dsAthleteKindOfSportList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
        }

        public void AtheleteChanged()
        {
            cbAthleteList.DataBind();
            cbAthleteKindOfSportList.DataBind();

            cbAthleteKindOfSportList.SelectedIndex = 0;
            AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
            KindOfSportIDFilter = (cbAthleteKindOfSportList.SelectedItem != null) ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;
        }

        public void KindOfSportChanged()
        {
            cbAthleteList.DataBind();
            cbAthleteKindOfSportList.DataBind();
            AthleteID = (cbAthleteList.SelectedItem != null) ? Convert.ToInt32(cbAthleteList.SelectedItem.Value) : 0;
            KindOfSportIDFilter = (cbAthleteKindOfSportList.SelectedItem != null) ? Convert.ToInt32(cbAthleteKindOfSportList.SelectedItem.Value) : 0;
        }
    }
}