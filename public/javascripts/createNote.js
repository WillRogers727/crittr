$(document).ready(function() {
	// alert("js fucntion check");
	var container = document.querySelector('.noteArtImageGallery');
	var canvas = document.querySelector('canvas')
	var ctx = canvas.getContext('2d');

	// initialize width and height
	setCanvasWidth(canvas);
	setCanvasHeight(canvas, container);
	
	// as the window changes with, adjust height of the canvas and container
	$(window).resize(function () { 
    setCanvasHeight(canvas,container);
	});
	

});

// sets the width of the canvas to 100%
function setCanvasWidth(canvas){ 
	canvas.style.width='100%';
	// canvas.style.height='100px';
	canvas.width  = canvas.offsetWidth;
	// canvas.height = canvas.offsetHeight;
}

// sets canvas height and container height to the same as the image
function setCanvasHeight(canvas, container){
	var h = $('#canvasImg').height();

	canvas.style.height= h + 'px';
	canvas.height = canvas.offsetHeight;

	container.style.height= h + 'px';
	container.height = container.offsetHeight;
}
