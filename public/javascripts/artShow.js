$(document).ready(function() {
	
	var activeHolder;
	var activeImage;


	//set the link that was just clicked to be the active reply link, so the form will only appear there
	$('.replyLink').click(function() {
		$('.replyLink.activeReply').removeClass('activeReply'); //remove active reply from any links with it currently on
		$(this).addClass('activeReply');
	});

  $('.fileInput').change(function(){
			if ($(this).val()) {
				$('.imageSubmit').attr('disabled',false); 
				$('.imageSubmit').removeClass('btn-disabled'); 
			}
		});

  


	$('.facebookIcon a').empty();
	$('.twitterIcon a').empty();
	$('.redditIcon a').empty();
	$('.facebookIcon a').append("<img class='socialIcon' src='/assets/facebook.png'></img>");
	$('.twitterIcon a').append("<img class='socialIcon' src='/assets/twitter.png'></img>");
	$('.redditIcon a').append("<img class='socialIcon' src='/assets/reddit.png'></img>");

	$('.image-1').addClass('visible');
	$('.image-1').removeClass('hidden');

	$("input:radio[name=artToggle][disabled=false]:first").attr('checked', true);
	
	//images are toggled
	$('.artToggle').change(function() {
			var num = this.value;
			var imgClass = "image-"+num;
			$('.artImage').removeClass('visible');
			$('.artImage').addClass('hidden');
			$('.'+imgClass).addClass('visible');
			$('.'+imgClass).removeClass('hidden');
			image = $('.'+imgClass+' > .artImageHolder img');
			holder = $('.'+imgClass+' > .artImageHolder');

			getActiveImage();
			setHolderHeight();
	});

	//need to make the art holder height the same as the image inside it
	//when - 
	//page is first loaded
	getActiveImage();
	setHolderHeight();
	//window is resized
	$(window).resize(function () { 
	  getActiveImage();
		setHolderHeight();
	});

	//function to get current active image and therefore holder
	function getActiveImage() {
		activeImage = document.querySelector('.visible .artImageHolder img');
		activeHolder = document.querySelector('.visible .artImageHolder');
	}
	//function to set the size
	function setHolderHeight() {
		var h = $(activeImage).height();
		activeHolder.style.height = h + 'px';
		activeHolder.height = activeHolder.offsetHeight;
	}

	$('.noteShow').click(function() {
		var val = this.name;
		showNote(val);
	});

	$('.noteHide').click(function() {
		var val = this.name;
		hideNote(val);
	});


	function showNote(val) {
		$('.noteImg-' + val).removeClass('hiddenNote');
		$('#nShow-' + val).addClass('hiddenBtn');
		$('#nHide-' + val).removeClass('hiddenBtn');
	}

	function hideNote(val) {
		$('.noteImg-' + val).addClass('hiddenNote');
		$('#nHide-' + val).addClass('hiddenBtn');
		$('#nShow-' + val).removeClass('hiddenBtn');

	}

	$("a.contentToggle.NoteToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.noteContent').slideToggle(200).toggleClass('contentActive');
	  $("a.contentToggle.NoteToggle > .toggleArrow").toggleClass('toggleArrowActive');
	});

	$(".commentToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.commentContent').slideToggle(200).toggleClass('contentActive');
	  $(".commentToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});

	$(".reviewToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.reviewContent').slideToggle(200).toggleClass('contentActive');
	  $(".reviewToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});

	$(".addToggle").on('click', function () {
		// alert("toggle clicked");
	  $('div.addContent').slideToggle(200).toggleClass('contentActive');
	  $(".addToggle > .darkToggleArrow").toggleClass('toggleArrowActive');
	});

	

	




});