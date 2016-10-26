// function takes array of words/phrases, returns longest one.
function longestPhrase(arrayPhrases) {
	//create a variable to store and return the longest phrase
	var longest = "";
	//iterate through each item in array
	for ( i = 0; i < arrayPhrases.length; i++ ) {
		if (arrayPhrases[i].length > longest.length) {
			longest = arrayPhrases[i];
		}
	}
	return longest;
}

//console.log(longestPhrase(["long phrase", "longest phrase", "longer phrase"]));

// function takes 2 obj and checks if they share key-value pairs
function keyValMatch(obj1, obj2) {
	//create nested loop
	//for each key in obj 1, check each key of obj 2 for match
	for(key1 in obj1) {
		for(key2 in obj2) {
			if ( (key1 == key2) && (obj1[key1] == obj2[key2])) {
				return true;
			}
		}
	}

	return false;
}

console.log(keyValMatch({name: "Steven", age: 50}, {name: "Tamir", age: 54}));