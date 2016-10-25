
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


console.log(addHorse(horseInfo, colors, horseNames));





