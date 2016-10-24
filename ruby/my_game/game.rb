# Create game class
class Game
	attr_reader :win_word, :remaining_guesses

	# User 1 enters word to initialize
	def initialize(win_word)
	# Set winning word
		@win_word = win_word
	# Initialize remaining guesses to win_word length
		@remaining_guesses = win_word.length
	end


	# User 2 guesses letter in word, or a word
	def guess(guess)


	end

	def correct_letter(letter)

	end

	def win

	end

	def lose

	end

end