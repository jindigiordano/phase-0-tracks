# Create game class
class Game
	attr_reader :win_word, :remaining_guesses, :past_guesses, :current_state

	# User 1 enters word to initialize
	def initialize(win_word)
	# Set winning word
		@win_word = win_word
	# Initialize remaining guesses to win_word length
		@remaining_guesses = win_word.length
	# Initialize array to store past guesses to check for repeats
		@past_guesses = []
	# Initialize string to represent current state of word, or, hint
		hint = ""
		hint_length = win_word.length
		hint_length.times { hint = hint + "_ " }
		@hint = hint
	end

	def update_hint(letter)

	end

	def win
		p "Congratulations, you win! The word was '#{@win_word}'"
	end

	def lose
		p "Haha, you couldn't guess it! The word was '#{@win_word}'"
	end

	# User 2 guesses letter in word, or a word
	def guess(guess)
		if guess == @win_word
			win
		else
			lose
		end

	end

end

p game = Game.new("robot")
p game.guess("robot")
