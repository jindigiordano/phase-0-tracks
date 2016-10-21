module Shout
	def yell_angrily(words)
		puts words + "!!!" + " :("
	end

	def yelling_happily(words)
		puts words + "!!!" + " :D"
	end

end

# p Shout.yell_angrily("sand")
# p Shout.yelling_happily("wizard")

class Town_Crier
	include Shout
end

class Referree
	include Shout
end

tc = Town_Crier.new

tc.yelling_happily("The war is over")

ref = Referree.new

ref.yell_angrily("Foul")