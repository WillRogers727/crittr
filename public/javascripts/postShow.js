// $(document).on('turbolinks:load', function() {
	
$(document).ready(function() {

	$('.facebookIcon a').empty();
	$('.twitterIcon a').empty();
	$('.redditIcon a').empty();
	$('.facebookIcon a').append("<img class='socialIcon' src='/assets/facebook.png'></img>");
	$('.twitterIcon a').append("<img class='socialIcon' src='/assets/twitter.png'></img>");
	$('.redditIcon a').append("<img class='socialIcon' src='/assets/reddit.png'></img>");
	
	$(".commentToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.commentShrinkSection').slideToggle(200).toggleClass('contentActive');
	  $(".commentToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});

	$("body").on("click", ".replyLink", function() {
		$('.commentReplyForm').remove(); //remove forms
		$('.activeReply').show(); //show link again
		$('.replyLink.activeReply').removeClass('activeReply'); //remove active reply from any links with it currently on
		$(this).addClass('activeReply');
		$('.commentMainControls').removeClass('replyFormActive'); //remove reply form styling
	});
	
	$("body").on("click", ".postVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.postVotes', this).addClass('activeVote');
	});

	$("body").on("click", ".commentVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.commentVotes', this).addClass('activeVote');
	});

	$("body").on("click", ".vote a", function() {
		$('.activeVoteArrows').removeClass('activeVoteArrows');
		$(this).closest('.voteSection').addClass('activeVoteArrows');
		$('.activeVoteArrows .vote .arrow').removeClass('voted');
		$('.arrow', this).addClass('voted');
	});


	//button on new comment form is only enabled when the text area contains a character
  $('.commentInput textarea').keyup(function() {
  	textLength = $('.commentInput textarea').val().length;
  	if (textLength > 0) {
  		//button is enabled
  		$('.commentSubmitBtn input').attr('disabled',false); 
  		$('.commentSubmitBtn input').removeClass('btn-disabled')
  	} else {
  		//button is disabled
  		$('.commentSubmitBtn input').attr('disabled',true); 
  		$('.commentSubmitBtn input').addClass('btn-disabled')
  	}
  });

	$('.commentFormSection .commentSubmit').click(function() {
		// alert("main form clicked");
		//set the active reply zone to be inside comment content
		$('.commentContent').addClass('activeCommentReplySection'); //set active reply section to the main feed of comments
		$('.commentMainControls').removeClass('replyFormActive'); //remove reply form styling
	});
});
// });