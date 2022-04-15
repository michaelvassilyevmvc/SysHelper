var athleteContactInfo = {
    StartEdit: function (s, e) {
        cbPanel.PerformCallback('edit_athlete_contact_info');
    },
    Save: function (s, e) {
        cbPanel.PerformCallback('save_athlete_contact_info');
    },
    Cancel: function (s, e) {
        cbPanel.PerformCallback('cancel_athlete_contact_info');
    }
}