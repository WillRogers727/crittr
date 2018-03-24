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
	}

	function setToggleDefault() {
		var win = $(this);
      if (win.width() < 1000) { 
      	$('.sidebar').addClass('closed');
				$('.gallery').addClass('full');
      }
	}

});







