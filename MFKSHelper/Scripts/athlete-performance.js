var athletesPerformance = {
	SendFirmInitValue: '',

	ShowTrainerListPopup: function (s, e) {
		ppcCustomModalEvents_CompletedSelect.Show();
		ppcCustomModalEvents_CompletedSelect.PerformCallback('bindgrid');
	},

	cbBusiness_trip_organization_gvAthletes_performance_Init: function (s, e) {
		if (s.GetItemCount() == 1)
			s.SetSelectedIndex(0);

		athletesPerformance.SendFirmInitValue = s.GetValue();
	},

	cbBusiness_trip_organization_gvAthletes_performance_SelectedIndexChanged: function (s, e) {
		if (s.GetValue() == gvAthletes_performance.cpAnotherFirmID) {
			var answer = confirm(gvAthletes_performance.cpAnotherFirmMessage);
			if (!answer) {
				s.SetValue(athletesPerformance.SendFirmInitValue);
			}
		}
	},

	SetEventResult: function (values) {
		if (values[0] === 'null') return;

		var value = values[0][0];
		var text = values[0][1];

		cbEventsCompletedList.ClearItems();

		var curItemIndex = cbEventsCompletedList.AddItem(text, value);
		cbEventsCompletedList.SetSelectedIndex(curItemIndex);
		cbEventsCompletedList.Validate(true);
	},

	eventSelectionCallback: function (values) {
		if (values[0] === null) {
			lpAthletesPerformance.Hide(); return;
		}

		athletesPerformance.SetEventResult(values);

		
		cbEventsCompletedList.Validate(true);
		lpAthletesPerformance.Hide();
	},

	EventCompletedList_Click: function (s, e) {
		lpAthletesPerformance.Show();
		gvEvents_CompletedSelect.GetSelectedFieldValues('ID;Name', athletesPerformance.eventSelectionCallback);
		ppcCustomModalEvents_CompletedSelect.Hide();
    },

	EventCompletedList_Cancel: function (s, e) {
		ppcCustomModalEvents_CompletedSelect.Hide();
    },

	gvEvents_CompletedSelect_SelectionChanged(s, e) {
		if (e.isSelected) {
			btnEvents_CompletedSelect.SetEnabled(e.isSelected);
		}
	},

}