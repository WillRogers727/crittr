$(document).ready(function() {
	// alert("js fucntion check");
	var container = document.querySelector('.noteArtImageGallery');
	var canvas = document.querySelector('canvas')
	var ctx = canvas.getContext("2d");

	var lastY;
	var lastX;
	var mousePressed = false;

	// initialize width and height
	setCanvasWidth(canvas);
	setCanvasHeight(canvas, container);
	
	// as the window changes with, adjust height of the canvas and container
	$(window).resize(function () { 
    setCanvasHeight(canvas,container);
	});
	
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
	});

	$('.noteCanvas').mouseleave(function (e) {
		// alert("mouse leave");	
		mousePressed = false;
	});

	function Draw(x, y, isDown) {
		if (isDown) {
			ctx.beginPath();
			ctx.strokeStyle = "#000";
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



	// initDraw(canvas);

	// //====================== Draw Rectangle ==========================

	// function initDraw(canvas) {
	// 	alert("init draw functioning");
	// 	function setMousePosition(e) {
	// 		var ev = e || window.event; //moz or IE
	// 		if (ev.pageX) {
	// 			mouse.x = ev.pageX + window.pageXOffset;
	// 			mouse.y = ev.pageY + window.pageYOffset;
	// 		} else if (ev.clientX) {
	// 			mouse.x = ev.clientX + document.body.scrollLeft;
	// 			mouse.y = ev.clientY + document.body.scrollTop;
	// 		}
	// 	};

	// 	var mouse = {
	// 		x: 0,
	// 		y: 0,
	// 		startX: 0,
	// 		startY: 0
	// 	};
	// 	var element = null;

	// 	canvas.onmousemove = function (e) {
	// 		setMousePosition(e);
	// 		if (element !== null) {
	// 			element.style.width = Math.abs(mouse.x - mouse.startX) + 'px';
 //        element.style.height = Math.abs(mouse.y - mouse.startY) + 'px';
 //        element.style.left = (mouse.x - mouse.startX < 0) ? mouse.x + 'px' : mouse.startX + 'px';
 //        element.style.top = (mouse.y - mouse.startY < 0) ? mouse.y + 'px' : mouse.startY + 'px';
	// 		}
	// 	}

	// 	canvas.onclick = function (e) {
	// 		if (element !== null) {
	// 			element = null;
	// 			canvas.style.cursor = "default";
	// 			console.log("finished");
	// 		} else {
	// 			console.log("begin");
	// 			mouse.startX = mouse.x;
	// 			mouse.startY = mouse.y;
	// 			element = document.createElement('div');
	// 			element.className = 'rectangle';
	// 		  element.style.width = Math.abs(mouse.x - mouse.startX) + 'px';
 //        element.style.height = Math.abs(mouse.y - mouse.startY) + 'px';
 //        element.style.left = (mouse.x - mouse.startX < 0) ? mouse.x + 'px' : mouse.startX + 'px';
 //        element.style.top = (mouse.y - mouse.startY < 0) ? mouse.y + 'px' : mouse.startY + 'px';
	// 		}
	// 	}

	// };

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
	