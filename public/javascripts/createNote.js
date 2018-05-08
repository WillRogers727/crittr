
var lastY;
var lastX;
var mousePressed = false;
var ctx;
var url;


function InitThis() { //when document initialised
	var canvas = document.querySelector('canvas'); //define html canvas and context
	ctx = canvas.getContext("2d");
	pushImg();
	

	//when mouse is pressed on canvas assign variable to true and begin draw function
	$('.noteCanvas').mousedown(function (e) {
		// alert("mouse down");
		mousePressed = true;
		Draw(e.pageX - $(this).offset().left, e.pageY - $(this).offset().top, false);
	});


	//as mouse is moved draw whilstppassing ture so that drawing actually occurs
	$('.noteCanvas').mousemove(function (e) {
		if (mousePressed) {
			// alert("mouse moved while pressed");
			Draw(e.pageX - $(this).offset().left, e.pageY - $(this).offset().top, true);
		}
	});


	//when mouse is raised set variable to false so that drawing stops
	$('.noteCanvas').mouseup(function (e) {
		// alert("mouse up");	
		mousePressed = false;
		//push image in its current state
		pushImg();
	});

//if mouse leaves the canvas, pressed or not, stop drawing and push image
	$('.noteCanvas').mouseleave(function (e) {
		// alert("mouse leave");		
		mousePressed = false;
		pushImg();
	});


	//touch controls, same as mouse however assigns page position for draw fucntion using touches from context
	$('.noteCanvas').on("touchstart", function (e) {
		// alert("touch start");
		e.preventDefault(); //stops a mouse event from being triggered
		var touches = e.changedTouches;

		// alert(touches[0].pageX);
		// alert("touch start");
		mousePressed = true;
		Draw(touches[0].pageX - $(this).offset().left, touches[0].pageY - $(this).offset().top, false);
		// alert("touch start after draw");
	});


	//same as mouse move, still using touches to define position
	$('.noteCanvas').on("touchmove", function (e) {
		if (mousePressed) {

			e.preventDefault(); //stops a mouse event from being triggered
			var touches = e.changedTouches;
			// alert("touch move");
			Draw(touches[0].pageX - $(this).offset().left, touches[0].pageY - $(this).offset().top, true);
		}
	});

	//stop drawing and push image in current state

	$('.noteCanvas').on("touchend", function (e) {
		// alert("touchend");	
		mousePressed = false;
		pushImg();
	});



} //end init function


//drawing function, define stroke attribute ssuch as colour and width then draw onto context
function Draw(x, y, isDown) {
	if (isDown) {
		// alert("is down true");
		ctx.beginPath();
		ctx.strokeStyle = $('#selColour').val();
		ctx.lineWidth = 4;
		ctx.lineJoin = "round";
		ctx.moveTo(lastX, lastY);
		ctx.lineTo(x, y); 
		ctx.closePath();
		ctx.stroke();
	}
	lastX = x; //assign previous x and y positions
	lastY = y;
}


//select context of canvas and clear, then push blank image in case of resize
function clearArea() {
	ctx.setTransform(1, 0, 0, 1, 0, 0);
	ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
	url = ctx.canvas.toDataURL('image/png');
}


//push image to base 64 url then assign to an element for transfer to rails db
function pushImg() {
	url = ctx.canvas.toDataURL('image/png');
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
		var cHeight = getCurrentHeight(canvas);
		var cWidth = getCurrentWidth(canvas); //obtain current width and height
	  setCanvasHeight(canvas,container); //set the canvas height if the window is resized
	  var scale = (cHeight/canvas.height); //find scale of new canvas compared to old so that image can be redrawn
	  redraw(ctx, scale, cWidth, cHeight, url); //redraw andy annotations back onto the image
	});

	//also resize and redraw on scroll for mobile browsers, as html5 canvas clears on some scroll events
	$(document).scroll(function() {
		var cHeight = getCurrentHeight(canvas);
		var cWidth = getCurrentWidth(canvas);
	  setCanvasHeight(canvas,container);
	  var scale = (cHeight/canvas.height);
	  redraw(ctx, scale, cWidth, cHeight, url);
	});

	InitThis(); //initialise canvas

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


	//gets the current height of the canvas and returns
	function getCurrentHeight(canvas) {
		var currentHeight = canvas.height;
		// alert(currentHeight);
		return currentHeight;
	}


	//gets the current width of the canvas and returns
	function getCurrentWidth(canvas) {
		var currentWidth = canvas.width;
		// alert(currentHeight);
		return currentWidth;
	}



	//re scales the canvas context to the correct size, then takes the pushed image and redraws if if further annotation is needed
	//html canvas automatically clears all drawing if the page is resized, so this function saves and redraws any existing image
	function redraw(ctx, scale, originalWidth, originalHeight, url) {
		ctx.canvas.height=originalHeight/scale;
		ctx.canvas.width=originalWidth/scale;

		ctx.scale(scale,scale);
		
		var img = new Image;
		img.src = url;

		ctx.drawImage(img, 0,0, ctx.canvas.width, ctx.canvas.height);
		
		
	}
		

});






