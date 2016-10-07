puts "What is your name?"
your_name = gets.chomp
age = 0
until age != 0
	puts "How old are you?"
	age = gets.chomp.to_i
	if age == 0
		puts "Please enter a valid integer above 0"
	end
end
birthyear = 0
until birthyear != 0
	puts "What year were you born?"
	birthyear = gets.chomp.to_i
	if birthyear == 0
		puts "Please enter a valid integer above 0"
	end
end
garlic = nil
until garlic == "y" || garlic == "n"
	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
	garlic = gets.chomp
	if garlic != "y" || garlic !="n"
		puts "Please enter 'y' or 'n'"
		garlic = gets.chomp
	end
end
if garlic == "y"
	garlic = true
else
	garlic = false
end
health_ins = nil
until health_ins == "y" || health_ins == "n"
	puts "Would you like to enroll in the company’s health insurance? (y/n)"
	health_ins = gets.chomp
	if health_ins != "y" || garlic !="n"
		puts "Please enter 'y' or 'n'"
		health_ins = gets.chomp
	end
end
if health_ins == "y"
	health_ins = true
else
	health_ins = false
end

puts "Name: #{your_name}"
puts "Age: #{age}"
puts "Birthyear: #{birthyear}"
puts "Likes Garlic Bread? #{garlic}"
puts "Wants Health Insurance? #{health_ins}"

is_vampire = nil


if (age == 2016 - birthyear || age + 1== 2016 - birthyear) && (garlic || health_ins) && !(name == 'Drake Cula' || name == 'Tu Fang')
	is_vampire = 'Probably not a vampire.'
elsif !(age == 2016 - birthyear || age + 1 == 2016 - birthyear) && (!garlic && health_ins) || (garlic && !health_ins) && !(name == 'Drake Cula' || name == 'Tu Fang')
	is_vampire = 'Probably a vampire.'
elsif !(age == 2016 - birthyear || age + 1 == 2016 - birthyear) && (!garlic && !health_ins) && !(name == 'Drake Cula' || name == 'Tu Fang')
	is_vampire = 'Almost certainly a vampire.'
elsif name == 'Drake Cula' || name == 'Tu Fang'
	is_vampire = 'Definitely a vampire.'
else
	is_vampire = "Results inconclusive"
end

puts is_vampire
