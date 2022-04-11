var SportInfo = {

	SelectTrainerText: '',
	SelectTrainerValue: '',

	ShowTrainerListPopup: function (s, e) {
		ppcCustomModalSportInfoTrainerSelect.Show();
		ppcCustomModalSportInfoTrainerSelect.PerformCallback('bindgrid');
	},

	btTrainersSelect_Cancel: function (s, e) {
		ppcCustomModalSportInfoTrainerSelect.Hide();
	},

	cbSportInfoPanel_EndCallback: function (s, e) {

		Master.cp_EndCallback(s, e);
	},

	trainerSelectionCallback: function (values) {
		if (values[0] === null) {
			lpSportInfo.Hide(); return;
		}

		SportInfo.SetTrainerResult(values);

		var trainerEntered = new Date(values[0][2]);
		var trainerEscape = (values[0][3] !== null) ? new Date(values[0][3]) : null;
		SportInfo.SetPeriodRang(trainerEntered, trainerEscape);
		cbTrainerList.Validate(true);
		lpSportInfo.Hide();
	},

	SetPeriodRang(min, max) {
		TrainerStartDate.SetMinDate(min);
		TrainerEndDate.SetMinDate(max);

		if (max !== null) {
			TrainerStartDate.SetMaxDate(max);
			TrainerEndDate.SetMaxDate(max)
        }
		
    },

	gvTrainersSelect_SelectionChanged(s, e) {
		if (e.isSelected) {
			btTrainersSelect.SetEnabled(e.isSelected);
		}
	},

	btTrainersSelect_Click: function (s, e) {
		lpSportInfo.Show();
		gvTrainersSelect.GetSelectedFieldValues('ID;FIO;Date_of_firm_entered;Date_of_firm_escaping', SportInfo.trainerSelectionCallback);		
		ppcCustomModalSportInfoTrainerSelect.Hide();
	},

	SetTrainerResult: function (values) {
		if (values[0] === 'null') return;

		var value = values[0][0];
		var text = values[0][1];

		cbTrainerList.ClearItems();

		var curItemIndex = cbTrainerList.AddItem(text, value);
		cbTrainerList.SetSelectedIndex(curItemIndex);
		cbTrainerList.Validate(true);
	},

	ClosingTrainerListPopup: function (s, e) {
		//очистка фильтра перед закрытием popup
		cbKindOfSportListFilter.SetText('');
    },

};