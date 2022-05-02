var AthleteSpecialOlimpicNorm = {
	gvAthletesKindsOfSport_ToolbarItemClick: function (s, e) {
		switch (e.item.name) {
			case 'FullExpand': gvAthletesKindsOfSport.ExpandAllDetailRows(); break;
			case 'FullCollapse': gvAthletesKindsOfSport.CollapseAllDetailRows(); break;
			case 'New': gvAthletesKindsOfSport.AddNewRow(); break;
		}
	}

}