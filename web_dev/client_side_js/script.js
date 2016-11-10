var imgs = document.getElementsByTagName("img");
img = imgs[0];
img.style.border = "4px dotted blue";

function rotate() {
	var imgs = document.getElementsByTagName("img");
	img = imgs[0];
	img.style['transform'] = "rotate(180deg)";
}

var btn = document.getElementById("btn");
btn.addEventListener("click", rotate);