$(document).ready(function() {

	$(".userArtToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.userArtContent').slideToggle(200).toggleClass('contentActive');
	  $(".userArtToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});


	$(".userPostToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.userPostContent').slideToggle(200).toggleClass('contentActive');
	  $(".userPostToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});



});
