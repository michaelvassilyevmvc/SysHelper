var Master = {
	cp_EndCallback: function (s, e) {
		if (s.cpPanelMessage) {
			eval(s.cpPanelMessage);
			delete s.cpPanelMessage;
		}
	},
}