class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
  	num.times { puts "Woof!" }
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	7 * human_years
  end

  def run(miles)
  	puts "I ran #{miles} miles!"
  end

  def initialize
  	puts "Initializing new puppy instance..."
  end

end



pup = Puppy.new
pup.fetch("ball")
pup.speak(3)
pup.roll_over
p pup.dog_years(1)
pup.run(2)

class Cat
	
	def initialize
		puts "Initialzing new cat instance..."
	end
	
	def meow(num)
		num.times {puts "Meow"}
	end
	
	def drink
		puts "*drink water*"
	end
end

kitten = Cat.new
kitten.meow(4)
kitten.drink
kitten_array = []
 50.times {
 kitten = Cat.new
 kitten_array << kitten }
 
kitten_array.each {|kitten| kitten.meow(2)
	kitten.drink}