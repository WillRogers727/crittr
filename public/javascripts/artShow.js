$(document).ready(function() {
	
	var container = document.querySelector('.artImageGallery');

	setContHeight(container);

	$(window).resize(function () { 
	   setContHeight(container);
	});




	// sets container height to the same as the image
	function setContHeight(container){
		var h = $('.artImage').height();

		container.style.height= h + 'px';
		container.height = container.offsetHeight;
	}
});