$(document).ready(function() {

	//assigns an active voting section when an artwork is clicked
	$("body").on("click", ".artVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.artVotes', this).addClass('activeVote');
	});


	//assigns an active voting section when a post upvote section is clicked
	$("body").on("click", ".postVoteSection", function() {
		$('.activeVote').removeClass('activeVote');
		$('.postVotes', this).addClass('activeVote');
	});

	//when an upvote or downvote is clicked, depending on the active vote section assigned previously the arrow is changed to filled.
	$("body").on("click", ".vote a", function() {
		$('.activeVoteArrows').removeClass('activeVoteArrows');
		$(this).closest('.voteSection').addClass('activeVoteArrows');
		$('.activeVoteArrows .vote .arrow').removeClass('voted');
		$('.arrow', this).addClass('voted');
	});



	//set sidebar dfault intially
	setToggleDefault();
	
	//when toggle is clicked, close or open sidebar
	$('.sidebarToggle').click(function () {
			toggleSidebar();
	});
	

	//when widnow size changes change the sidebar default
	$(window).on('resize', function(){
      setToggleDefault();
	});


	//close sidebar and make gallery full width
	function toggleSidebar() {
		$('.sidebar').toggleClass('closed');
		$('.gallery').toggleClass('full');
		$('.toggleSide').toggleClass('toggleSideOut');
	}


	//depending on screen size, toggle the sidebar to default to closed or open
	//closed by default on mobile or tablet
	function setToggleDefault() {
		var win = $(this);
      if (win.width() < 1000) { 
      	$('.sidebar').addClass('closed');
				$('.gallery').addClass('full');
				$('.toggleSide').addClass('toggleSideOut');
      }

	}

});







