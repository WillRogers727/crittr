# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#arts').imagesLoaded ->
		$('#arts').masonry
			itemselector: '.artworkContainer'
			isFitWidth: true

	$('.thumbnail').hover ->
		$('#arts').masonry
			itemselector: '.artworkContainer'
			isFitWidth: true

	$('.thumbnail').click ->
		$('#arts').masonry
			itemselector: '.artworkContainer'
			isFitWidth: true

