
$(document).ready(function() {


	//toggles art gallery content
	$(".userArtToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.userArtContent').slideToggle(200).toggleClass('contentActive');
	  $(".userArtToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});

	//toggles post gallery content
	$(".userPostToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.userPostContent').slideToggle(200).toggleClass('contentActive');
	  $(".userPostToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});


	//assigns active vote section
	$("body").on("click", ".artVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.artVotes', this).addClass('activeVote');
	});
	//assigns active vote section
	$("body").on("click", ".postVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.postVotes', this).addClass('activeVote');
	});


	//changes vote to active depending on active vote section
	$("body").on("click", ".vote a", function() {
		$('.activeVoteArrows').removeClass('activeVoteArrows');
		$(this).closest('.voteSection').addClass('activeVoteArrows');
		$('.activeVoteArrows .vote .arrow').removeClass('voted');
		$('.arrow', this).addClass('voted');
	});

});
