/* Get URL Parameters */
var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	sURLVariables = sPageURL.split('&'),
	sParameterName,
	i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

// Token
var token = getUrlParameter('token');

$(document).ready(function(){
	$('a.enable-theme').on('click', function(e) {
		e.preventDefault();

		var thisButton = $(this);

		thisButton.button('loading');

		var themeName = encodeURIComponent(thisButton.closest('.profile_details').data('theme-name'));

		$.ajax({
			type: 'get',
			url: 'index.php?route=extension/module/b5b_qore_engine/enableTheme&token=' + encodeURIComponent(token) + '&theme_name=' + themeName,
			dataType: 'json',
			success: function(json) {
				console.log(json);
				if(json.success){
					location.reload();
				}else{
					thisButton.button('reset');
					console.log('here');
					thisButton.closest('.bottom').before('<div class="col-xs-12"><div role="alert" class="alert alert-danger alert-dismissible fade in"><button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span></button>' + json.error_message + '</div></div>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$(this).button('reset');
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});