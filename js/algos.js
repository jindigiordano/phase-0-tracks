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
//console.log(longestPhrase(["jim", "bob", "humphrey"]));
//console.log(longestPhrase(["do or do not", "nooooo", "may the force be with you"]));


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

//console.log(keyValMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
//console.log(keyValMatch({name: "Anakin", age: 24}, {name: "Obi Wan", age: 34}));

//function that takes int for length, builds and returns arr of str of length
function createWordArr(length) {
	//alphabet array
	var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

	//array of words to pick from
	//var randomWords = ["a", "be", "the", "yoda", "blast", "bantha", "podrace", "cryonics", "skywalker", "lightsaber"];
	//initialize array of words to push to and return
	var finalArray = [];
	//iterate over the first given number of array items and push to final array
	for ( i = 0; i < length; i++ ) {
		//set random word length
		var wordLength = Math.floor(Math.random() * 10) + 1;
		//create word of the random length and push to array
		//initialize word
		var randomWord = "";
		//add letters for length of word specified
		for ( j = 0; j < wordLength; j++ ) {
			//add a random letter to randomWord
			randomWord += alphabet[Math.floor(Math.random() * 25)];
			if (randomWord.length == wordLength) {
				//push word to final array
				finalArray.push(randomWord);
			}
		}
	}
	return finalArray;
}
//console.log(createWordArr(3));
//console.log(createWordArr(6));

//10 times
//generate & print array
//feed arr to longest word fn and prints


times = 0;
while ( times <= 9) {
	var createdArray = createWordArr(Math.floor(Math.random() * 9) + 1);
	console.log(createdArray);
	console.log(longestPhrase(createdArray));
	times++;
}