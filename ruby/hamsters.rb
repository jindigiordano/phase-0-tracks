puts "What is the hamster's name?"
hname = gets.chomp
puts "How loud is the hamster? (1 to 10)"
volume = gets.chomp.to_i
puts "What color is the hamster?"
color = gets.chomp
adoptable = ""
until adoptable == "y" || adoptable == "n"
	puts "Is this hamster good for adoption? (please answer y/n)"
	adoptable = gets.chomp
	if adoptable != "y" && adoptable != "n"
	puts "Please enter 'y' or 'n' "
	end
end
if adoptable == "y"
	adoptableval = true
else
	adoptableval = false
end
puts "Estimated age? (decimal form) If you don't know, just hit enter"
age = gets.chomp
if age != ""
	age.to_f
else 
	age = nil
end

puts "Hampster Name: #{hname}"
puts "Volume: #{volume}"
puts "Color: #{color}"
puts "Adoptable?: #{adoptableval}"
puts "Est. Age: #{age}"