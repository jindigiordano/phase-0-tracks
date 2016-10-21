module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + "!!!" + " :D"
	end

end

p Shout.yell_angrily("sand")
p Shout.yelling_happily("wizard")