$(document).ready(function() {
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







