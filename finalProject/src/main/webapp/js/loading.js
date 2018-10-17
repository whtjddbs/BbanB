
$.ajaxSetup({
	beforeSend: function () {
		$('#loading_frame').show();
	}
	, complete: function () {
		$("#loading_frame").hide();
	}
});