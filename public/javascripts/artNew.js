$(document).ready(function() {
	$('.fileInput').change(function(){
		if ($(this).val()) {
			$('.imageSubmit').attr('disabled',false); 
			$('.imageSubmit').removeClass('btn-disabled'); 
		}
	});
});
	