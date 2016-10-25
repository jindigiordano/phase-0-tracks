
function reverse(str) {
	var reversedWord = ""
// iterate through each character in the string, starting with last
	for ( var i = str.length - 1; i >=0; i-- ) {
		// push each char into a reversedWord
		reversedWord = reversedWord + str[i];
	}
// return the reversed word
	return reversedWord;
}

rWord = reverse("snake");

if (rWord.length > 2) {
	console.log(rWord);
}