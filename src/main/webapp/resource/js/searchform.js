$(function(){
	$("#search").on("click", function() {
		if ($("#param").val().trim() != '') {
			$('#searchform').submit();
		}
	});
});
