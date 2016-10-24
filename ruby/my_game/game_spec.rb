require_relative 'game'

describe Game do
	let(:new_game) { Game.new("wombat")}
	# One user can enter a word or phrase, and another user attempts to guess the word.
	it "checks a guess against the winning word" do
	end
	# Guesses are limited, and the number of guesses available is related to the length of the word.
	it "updates and outputs remaining guesses" do
	end
	# Repeated guesses do not count against the user.
	it "does not decrease remaining guesses if it is a repeated guess" do
	end
	# User receives feedback on current state of word
	it "gives feedback on current state of word" do
	end
	# Congratulatory message if win, taunting message if lost
	it "gives a congratularoty message on win, taunting message on loss" do
	end
end