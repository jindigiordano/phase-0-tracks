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

console.log(longestPhrase(["long phrase", "longest phrase", "longer phrase"]));