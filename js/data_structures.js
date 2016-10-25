
var colors = ["magenta", "red", "green", "yellow"];

var horseNames = ["Ned", "Ted", "Fred", "Lexy"];

function addColor(array, color){
	 array.push(color);
	 return array;
}

function addName(array,name){
	array.push(name);
	return array;
}

//console.log(addColor(colors, "white"));
//console.log(addName(horseNames, "Bob"));


var horseInfo = {}

function addHorse(object, colorArray, nameArray){
	
	for(i = 0; i < colorArray.length; i++){
		
		object[nameArray[i]] = colorArray[i];
	}
	
	return object;
}


//console.log(addHorse(horseInfo, colors, horseNames));

var car = {};

function Car(color, year, used) {
	this.color = color;
	this.year = year;
	this.used = used;

	this.revv = function() {
		console.log("Vroom...");
	}

	console.log("New car completed");
}

var jinsCar = new Car("red", 2010, true);
console.log(jinsCar);
console.log(jinsCar["color"]);
console.log(jinsCar.revv());

var mattsCar = new Car("white", 2005, false);
console.log(mattsCar);
console.log(mattsCar["color"]);
console.log(mattsCar.revv());




