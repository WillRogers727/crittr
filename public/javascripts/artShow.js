$(document).ready(function() {
	
	var activeHolder;
	var activeImage;

	

	$('.image-1').addClass('visible');
	$('.image-1').removeClass('hidden');
	

	$('.artToggle').change(function() {
			var num = this.value;
			var imgClass = "image-"+num;
			$('.artImage').removeClass('visible');
			$('.artImage').addClass('hidden');
			$('.'+imgClass).addClass('visible');
			$('.'+imgClass).removeClass('hidden');
			image = $('.'+imgClass+' > .artImageHolder img');
			holder = $('.'+imgClass+' > .artImageHolder');

			getActiveImage();
			setHolderHeight();

			// $(activeImage).addClass('yo');
			// $(activeHolder).addClass('yoHolder');
	});

	getActiveImage();
	setHolderHeight();

	//need to make the art holder height the same as the image inside it
	//when - 
	//page is first loaded

	//window is resized
	$(window).resize(function () { 
	  getActiveImage();
		setHolderHeight();
	});
	//images are toggled



	//function to get current active image and therefore holder
	function getActiveImage() {
		// alert("get active image started");
		activeImage = document.querySelector('.visible .artImageHolder img');
		activeHolder = document.querySelector('.visible .artImageHolder');
	}
	//function to set the size
	function setHolderHeight() {
		// alert("holder setting");
		var h = $(activeImage).height();
		// alert(h);
		activeHolder.style.height = h + 'px';
		activeHolder.height = activeHolder.offsetHeight;
	}


	// var holder = document.querySelector('.image-1 > .artImageHolder');
	// var image = document.querySelector('.image-1 > .artImageHolder img');
	// setContHeight(initialHolder, initialImage); //initialise height with image 1 - not running?



});