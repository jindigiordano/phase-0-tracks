require_relative 'game'

describe Game do
	let(:new_game) { Game.new("wombat")}
	# One user can enter a word or phrase, and another user attempts to guess the word.
	it "checks a guessed letter or word to see if it's contained in the winning word" do
		expect(new_game.guess("a")).to eq "Nice guess!"
		expect(new_game.guess("c")).to eq "Sorry, try again!"
	end
	# Guesses are limited, and the number of guesses available is related to the length of the word.
	it "updates and outputs remaining guesses" do
		new_game.guess("a")
		new_game.guess("c")
		expect(new_game.remaining_guesses).to eq 9
	end
	# Repeated guesses do not count against the user.
	it "does not decrease remaining guesses if it is a repeated guess" do
		new_game.guess("a")
		new_game.guess("a")
		expect(new_game.remaining_guesses).to eq 10
	end
	# User receives feedback on current state of word
	it "gives feedback on current state of word" do
		new_game.guess("a")
		new_game.guess("c")
		expect(new_game.hint).to eq "_ _ _ _ a _ "
	end
	# Congratulatory message if win
	it "gives a congratulatory message on win" do
		expect(new_game.guess("wombat")).to eq "Congratulations, you win! The word was 'wombat'"
	end
	# Taunting message on loss
	it "gives taunting message on loss" do
		new_game.remaining_guesses = 1
		expect(new_game.guess("lizard")).to eq "Haha, you couldn't guess it! The word was 'wombat'"
	end
end