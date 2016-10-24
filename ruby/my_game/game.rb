# Create game class
class Game
	attr_reader :win_word, :past_guesses, :hint
	attr_accessor :remaining_guesses

	# User 1 enters word to initialize
	def initialize(win_word)
	# Set winning word
		@win_word = win_word
		@win_arr = win_word.split("")
	# Initialize remaining guesses to win_word length plus 5
		@remaining_guesses = win_word.length + 5
	# Initialize array to store past guesses to check for repeats
		@past_guesses = []
	# Initialize string to represent current state of word, or, hint
		hint = ""
		hint_length = win_word.length
		hint_length.times { hint = hint + "_ " }
		@hint = hint
		puts "Ok! User 2 please take over."
		puts "Guess the word!"
		puts "Here's a hint: #{@hint}"
	end

	def win
		p "Congratulations, you win! The word was '#{@win_word}'"
	end

	def lose
		p "Haha, you couldn't guess it! The word was '#{@win_word}'"
	end

	def update_hint(letter)
		char_ind = 0
		@win_word.each_char { |char|
			if char == letter
				hint_ind = char_ind * 2
				@hint[hint_ind] = char
			end
			char_ind += 1
		}
		@hint_str = @hint.delete " "
		#update the status
		p @hint
	end

	def guesses_remaining
			# decrease by one
			@remaining_guesses -= 1

	end

	# User 2 guesses letter in word, or a word
	def guess(guess)
		# Make sure the guess is either a letter or the whole word
		if guess.length != 1 && guess.length != @win_word.length
			p @remaining_guesses.to_s + " guesses left"
			p "Guess a letter, or the complete word!"
		# check for repeated guesses
		elsif @past_guesses.include? guess
			p @remaining_guesses.to_s + " guesses left"
			p @hint
			p "You guessed that already!"
		# check if they guessed the entire word correctly
		elsif guess == @win_word
			win
		# if the letter is not in the word
		elsif !@win_word.include? guess
			# Add guess to arrayof past guesses
			@past_guesses << guess
			if @remaining_guesses == 1
				lose
			else
			guesses_remaining
			p @remaining_guesses.to_s + " guesses left"
			p @hint
			p "Sorry, try again!"
			end
		# if the letter is in the word
		elsif @win_word.include? guess
			# Add guess to arrayof past guesses
			@past_guesses << guess
			guesses_remaining
			p @remaining_guesses.to_s + " guesses left"
			update_hint(guess)
			if @hint_str == @win_word
				win
			else
				p "Nice guess!"
			end
		else
			p "Error"
		end

	end

end

puts "User 1, enter a word to guess"
# If we were doing this for real humans, could do:
# word = gets.chomp
# game1 = Game.new(word)
game1 = Game.new("robot")
# Game prompts user 2 to take over
# If we were doing this for real humans, could do:
# letter = gets.chomp
# game2.guess(letter)
# and so on...
game1.guess("cat")
game1.guess("a")
game1.guess("e")
game1.guess("i")
game1.guess("o")
game1.guess("r")
game1.guess("r")
game1.guess("b")
game1.guess("t")

puts "User 1, enter a word to guess"
game2 = Game.new("leaf")
game2.guess("a")
game2.guess("e")
game2.guess("w")
game2.guess("jar")
game2.guess("knot")
game2.guess("w")
game2.guess("m")
game2.guess("k")
game2.guess("b")
game2.guess("v")
game2.guess("g")