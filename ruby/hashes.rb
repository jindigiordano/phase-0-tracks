# Define method to gather info on client
def interior_design 
# Get name
	puts "What is your name?"
	# Create hash and key for name
	client = {}
	client[:name] = gets.chomp
# Get and create key for age
	client[:age] = 0
	# Make sure input is valid integer
	until client[:age] > 0
		puts "What is your age?"
		client[:age] = gets.chomp.to_i
		if client[:age] <= 0
			puts "Please enter an integer over 0"
		end
	end
# Get and create key for num of children
	client[:children] = -1
	# Make sure input is valid
	until client[:children] >= 0
		puts "How many children live in the house?"
		client[:children] = gets.chomp.to_i
		if client[:children] < 0
			puts "Please enter an integer 0 or greater"
		end
	end
# Get and create key for num of pets
	client[:pets] = -1
	# Make sure input is valid
	until client[:pets] >= 0
		puts "How many pets do you have?"
		client[:pets] = gets.chomp.to_i
		if client[:pets] < 0
			puts "Please enter an integer 0 or greater"
		end
	end
# If has pets, make array of what kind
	if client[:pets] > 0
		client[:pet_types] = []
		puts "What kind of pets do you have? (enter each different kind, 'done' when finished)"
		until gets.chomp == "done"
			client[:pet_types] << get.chomp
		end
	end
# Get and create key for decor theme
	client[:theme] = ""
	until client[:theme] == "rustic" || client[:theme] == "gothic" || client[:theme] == "country"
		puts "Which theme do you want: rustic, gothic, or country?"
		client[:theme] = gets.chomp
		# Make sure it's one of the 3 styles offered
		if client[:theme] != "rustic" && client[:theme] !="gothic" && client[:theme] != "country"
			puts "Please enter a valid choice"
		end
	end
# Get and create new key for if they have high ceilings
	client[:ceilings] = ""
	until client[:ceilings] == "y" || client[:ceilings] == "n"
		puts "Do you have high ceilings? (y/n)"
		client[:ceilings] = gets.chomp
		# Make sure it's a valid choice
		if client[:ceilings] != "y" && client[:ceilings] !="n"
			puts "Please enter 'y' or 'n'"
		end
	end
# Convert answer to boolean
	if client[:ceilings] == "y"
		client[:ceilings] == true
	else
		client[:ceilings] == false
	end
# Print hash
	p client
# Ask user if need to correct anything and enter key, if not enter "none"
	puts "If you'd like to correct anything, enter the key or enter 'none' if correct"
	the_key = gets.chomp
# If so, update key and print hash again
	if the_key != "none"
		puts "What would you like to update #{the_key} to?"
		client[the_key] = gets.chomp
		p client
	end
	puts "Thank you!"
end

interior_design