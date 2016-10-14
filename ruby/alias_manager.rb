# Define method to create alias
def alias_creator(agent_name) 
	# Array of vowels
	vowels = ['a', 'e', 'i', 'o', 'u']

	# Array of consonants
	consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

	# Change name to lower case
	lower_name = agent_name.downcase

	# Split name into array of first and last
	name_arr = lower_name.split(' ')
	
	# Swap first and last names
	f_name = name_arr[1]
	l_name = name_arr[0]

	# Change strings to arrays of letters to iterate through easier
	f_name_arr = f_name.chars
	l_name_arr = l_name.chars
	
	# Initialize new arr to store alias first name in
	alias_f_arr = []
	
	# Iterate through letters in first name
	f_name_arr.each { |i| 
		# If letter is vowel, change to next vowel by upping index in vowel array
		if vowels.include?(i)
			ind = vowels.index(i)
			ind += 1
			# Edge case
			if ind == 5
				ind = 0
			end
			alias_f_arr << vowels[ind]
		# If consonant, change to next consonant by upping index in consonant array
		elsif consonants.include?(i) 
			ind = consonants.index(i)
			ind += 1
			# Edge case
			if ind == 21
				ind = 0
			end
			alias_f_arr << consonants[ind]
		end
	}
	# Join alias first name array to string
	alias_f = alias_f_arr.join
	# Capitalize first letter of alias first name
	alias_f.capitalize!

	# Initialize new arr to store alias LAST name in
	alias_l_arr = []
	
	# Iterate through letters in first name
	l_name_arr.each { |i| 
		# If letter is vowel, change to next vowel by upping index in vowel array
		if vowels.include?(i)
			ind = vowels.index(i)
			ind += 1
			# Edge case
			if ind == 5
				ind = 0
			end
			alias_l_arr << vowels[ind]
		# If consonant, change to next consonant by upping index in consonant array
		elsif consonants.include?(i) 
			ind = consonants.index(i)
			ind += 1
			# Edge case
			if ind == 21
				ind = 0
			end
			alias_l_arr << consonants[ind]
		end
	}
	# Join alias first name array to string
	alias_l = alias_l_arr.join
	# Capitalize first letter of alias first name
	alias_l.capitalize!
	
	# Concat first and last names to make one string
	full_alias = alias_f + " " + alias_l
	full_alias
end

p alias_creator('Felicia Torres')