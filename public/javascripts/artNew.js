
	$(document).ready(function() {
		//when the file input changes make the submit button active and pressable
		$('.fileInput').change(function(){
			if ($(this).val()) {
				$('.imageSubmit').attr('disabled',false); 
				$('.imageSubmit').removeClass('btn-disabled'); 
			}
		});
	});