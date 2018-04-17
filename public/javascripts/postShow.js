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
	

	$('.commentFormSection .commentSubmit').click(function() {
		// alert("main form clicked");
		//set the active reply zone to be inside comment content
		$('.commentContent').addClass('activeCommentReplySection'); //set active reply section to the main feed of comments
		$('.commentMainControls').removeClass('replyFormActive'); //remove reply form styling
	});
});