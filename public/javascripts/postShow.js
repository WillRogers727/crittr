$(document).ready(function() {

	$(".commentToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.commentContent').slideToggle(200).toggleClass('contentActive');
	  $(".commentToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});
});