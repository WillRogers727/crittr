$(document).ready(function() {
	// alert("js fucntion check");
	var container = document.querySelector('.noteArtImageGallery');

	var canvas = document.querySelector('canvas')
	var ctx = canvas.getContext('2d');
	setCanvasWidth(canvas);
	setCanvasHeight(canvas, container);
	$(window).resize(function () {
    setCanvasHeight(canvas,container);
});
	

});

function setCanvasWidth(canvas){
	canvas.style.width='100%';
	// canvas.style.height='100px';
	canvas.width  = canvas.offsetWidth;
	// canvas.height = canvas.offsetHeight;
}


function setCanvasHeight(canvas, container){
	var h = $('#canvasImg').height();

	canvas.style.height= h + 'px';
	canvas.height = canvas.offsetHeight;

	container.style.height= h + 'px';
	container.height = container.offsetHeight;
}
