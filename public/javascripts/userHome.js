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

	$("body").on("click", ".artVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.artVotes', this).addClass('activeVote');
	});

	$("body").on("click", ".postVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.postVotes', this).addClass('activeVote');
	});

	$("body").on("click", ".vote a", function() {
		$('.activeVoteArrows').removeClass('activeVoteArrows');
		$(this).closest('.voteSection').addClass('activeVoteArrows');
		$('.activeVoteArrows .vote .arrow').removeClass('voted');
		$('.arrow', this).addClass('voted');
	});

});
