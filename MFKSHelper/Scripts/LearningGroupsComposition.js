var LearningGroupsComposition = {

    cbLearningGroupCompositionPanel_EndCallback: function (s, e) {

        //Master.cp_EndCallback(s, e);

        ////show athlete list
        //if (hfAthletesProps.Contains('AthleteSelectInnerShowModal')) {
        //    $('#customModalAthleteSelectInner').modal({ clickClose: false });
        //    hfAthletesProps.Remove('AthleteSelectInnerShowModal');
        //}

        ////add info for new athlete
        //if (hfAthletesProps.Contains('AthletePropsSelectShowModal')) {
        //    $('#customModalAthletePropsSelect').modal({ clickClose: false });
        //    hfAthletesProps.Remove('AthletePropsSelectShowModal');
        //}

        ////transfer athlete to group
        //if (hfAthletesProps.Contains('GroupTransferDateShowModal')) {
        //    $('#customModalGroupTransferDate').modal({ clickClose: false });
        //    hfAthletesProps.Remove('GroupTransferDateShowModal');
        //}

        if (hfAthletesProps.Contains('GroupSelectShowModal')) {
            $('#customModalGroupSelect').modal({
                escapeClose: false,
                clickClose: false,
                showClose: false });
            hfAthletesProps.Remove('GroupSelectShowModal');
        }
    },

    btGroupSelect_Click: function (s, e) {
        $.modal.close();
    },

    cbShowAllAthletes_SelectedIndexChanged: function (s, e) {
        hfAthletesProps.Set('ShowArchive', s.GetValue());
        gvGroups.Refresh();
    },

    hlSelectGroup_gvGroups_Click: function (s, e) {
        //Learning_groups_composition.AthleteID = s.cpAthleteID;
        //Learning_groups_composition.DateFrom = s.cpDateFrom;

        //hfAthletesProps.Set('dateFrom', s.cpDateFrom);
        cbLearningGroupCompositionPanel.PerformCallback('GroupSelectShowModal');
    },

    gvGroupSelect_SelectionChanged(s, e) {

        if (e.isSelected)
            hfAthletesProps.Set('transferGroupSelectIndex', gvGroupSelect.GetRowKey(e.visibleIndex));

        btGroupSelect.SetEnabled(hfAthletesProps.Contains('transferGroupSelectIndex'));
    },


    btTransferDate_Click: function (s, e) {
        gvGroupSelect.GetSelectedFieldValues('ID', function (groupID) {
            hfAthletesProps.Set('transferDate', deTransferDate.GetValue());
            hfAthletesProps.Set('transferDescription', memoTransferDescription.GetText());
            cbLearningGroupCompositionPanel.PerformCallback('transfer');
            $.modal.close();
        });
    },


    deTransferDate_DateChanged: function (s, e) {
        btTransferDate.SetEnabled(s.GetValue() !== null);
    },

    cbSelectAthlete_gvGroups_ButtonClick: function (s, e) {
        hfAthletesProps.Set("athleteSelectIndexes", cbSelectAthlete_gvGroups.GetValue() + ';');
        cbLearningGroupCompositionPanel.PerformCallback('updateAthleteSelectInner');
    },

    ppcAthletePropsSelectApply: function (s, e) {
        var dateFrom = deDateFrom_gvGroups.GetValue();
        var dateTo = deDateTo_gvGroups.GetValue();
        var memo = memoDescription_gvGroups.GetValue();


        hfAthletesProps.Set('dateStart', dateFrom);

        if (dateTo != null) {
            hfAthletesProps.Set('dateEnd', dateTo);
        }
        else {
            hfAthletesProps.Remove('dateEnd');
        }

        hfAthletesProps.Set('memo', memo);

        cbLearningGroupCompositionPanel.PerformCallback('InsertAthletesIDs');
        $.modal.close();
    },

    btAthleteSelect_Click: function (s, e) {
        $.modal.close();
        if (hfAthletesProps.Contains('Edit')) {

        }
        else {
            cbLearningGroupCompositionPanel.PerformCallback('AthletePropsSelect');
        }
    },



    gvGroups_ToolbarItemClick: function (s, e) {
        if (e.item.name === "tbbtNew") {
            gvGroups.CancelEdit();
            gvGroups.cpEditRowIndex = -1;

            cbLearningGroupCompositionPanel.PerformCallback('AthleteSelectInner');
        }
    },

    //gvAthleteSelect_SelectionChanged: function (s, e) {
    //    var key = gvAthleteSelect.GetRowKey(e.visibleIndex);
    //    var arrStr = hfAthletesProps.Get('athleteSelectIndexes');

    //    var arr = arrStr === '' ? [] : arrStr.split(';');


    //    if (e.isSelected) {
    //        arr.push(key);
    //    }
    //    else {
    //        arr = Master.arrayRemove(arr, key);

    //    }

    //    hfAthletesProps.Set("athleteSelectIndexes", arr.join(';'));

    //    btAthleteSelect.SetEnabled(gvAthleteSelect.GetSelectedRowCount() > 0);

    //},
}