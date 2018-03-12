$(document).ready(function() {
	
	$('.image-1').addClass('visible');
	$('.image-1').removeClass('hidden');
	var holder = document.querySelector('.image-1 > .artImageHolder');
	var image = document.querySelector('.image-1 > .artImageHolder img');
	setContHeight(initialHolder, initialImage); //initialise height with image 1 - not running?

	

	$('.artToggle').change(function() {
			var num = this.value;
			var imgClass = "image-"+num;
			$('.artImage').removeClass('visible');
			$('.artImage').addClass('hidden');
			$('.'+imgClass).addClass('visible');
			$('.'+imgClass).removeClass('hidden');
			image = $('.'+imgClass+' > .artImageHolder img');
			holder = $('.'+imgClass+' > .artImageHolder');
			setContHeight(image, holder);
	});


	$(window).resize(function () { 
	   setContHeight(image, holder);
	});
		//the current image holder
		

		// the current image

	// sets image holder height to the same as the image
	
	function setContHeight(image, holder){
		alert("fuck my tits");
		var h = image.height();
		
		holder.style.height = h + 'px';
		holder.height = holder.offsetHeight;
	}
});