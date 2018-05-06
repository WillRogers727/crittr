// $(document).on('turbolinks:load', function() {
var lastY;
var lastX;
var mousePressed = false;
var ctx;



function InitThis() {
	var canvas = document.querySelector('canvas');
	ctx = canvas.getContext("2d");

	$('.noteCanvas').mousedown(function (e) {
		// alert("mouse down");
		mousePressed = true;
		Draw(e.pageX - $(this).offset().left, e.pageY - $(this).offset().top, false);
	});

	$('.noteCanvas').mousemove(function (e) {
		if (mousePressed) {
			// alert("mouse moved while pressed");
			Draw(e.pageX - $(this).offset().left, e.pageY - $(this).offset().top, true);
		}
	});

	$('.noteCanvas').mouseup(function (e) {
		// alert("mouse up");	
		mousePressed = false;
		pushImg();
	});

	$('.noteCanvas').mouseleave(function (e) {
		// alert("mouse leave");		
		mousePressed = false;
		pushImg();
	});

} //end init function

function Draw(x, y, isDown) {
	if (isDown) {
		ctx.beginPath();
		ctx.strokeStyle = $('#selColour').val();
		ctx.lineWidth = 4;
		ctx.lineJoin = "round";
		ctx.moveTo(lastX, lastY);
		ctx.lineTo(x, y);
		ctx.closePath();
		ctx.stroke();
	}
	lastX = x;
	lastY = y;
}

function clearArea() {
	ctx.setTransform(1, 0, 0, 1, 0, 0);
	ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
}

function pushImg() {
	var url = ctx.canvas.toDataURL('image/png');
	// alert(url);
	$("#canvasContent").val(url);
}

$(document).ready(function() {

	// alert("js fucntion check");
	var container = document.querySelector('.noteArtImageGallery');
	var canvas = document.querySelector('canvas');

	// initialize width and height
	setCanvasWidth(canvas);
	setCanvasHeight(canvas, container);
		
	// as the window changes with, adjust height of the canvas and container
	$(window).resize(function () { 
	   setCanvasHeight(canvas,container);
	});

	InitThis();

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
		

});



// });



