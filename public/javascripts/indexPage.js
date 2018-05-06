$(document).on('turbolinks:visit', function() {
// $(document).ready(function() {

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


	setToggleDefault();
	$('.sidebarToggle').click(function () {
			toggleSidebar();
	});
	
	$(window).on('resize', function(){
      setToggleDefault();
	});

	function toggleSidebar() {
		$('.sidebar').toggleClass('closed');
		$('.gallery').toggleClass('full');
		$('.toggleSide').toggleClass('toggleSideOut');
	}

	function setToggleDefault() {
		var win = $(this);
      if (win.width() < 1000) { 
      	$('.sidebar').addClass('closed');
				$('.gallery').addClass('full');
				$('.toggleSide').addClass('toggleSideOut');
      }

	}

});
// });







