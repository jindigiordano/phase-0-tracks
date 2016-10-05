puts "What is the hamster's name?"
name = gets.chomp
puts "How loud is the hamster? (1 to 10)"
volume = gets.chomp.to_i
puts "What color is the hamster?"
color = gets.chomp
puts "Is this hamster good for adoption? (y/n)"
adoptable = gets.chomp
age = nil
puts "Estimated age? (decimal form) If you don't know, just hit enter"
age = gets.chomp.to_f
