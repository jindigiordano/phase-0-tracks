# Method to create a list
def create_list(items, quantity)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Split input into an array by spaces
  item_array = items.split(" ")
  # Create empty hash
  list = {}
  # Iterate through the array
  item_array.each { |item| 
  # For each item in the array create a new hash key
  # set default quantity
  	list[item] = quantity
  }
  # print the list to the console [can you use one of your other methods here?]
  list
# output: hash with items and default quantity
end

# Method to add an item to a list
def add_list(hash, item, quantity)
# input: hash, item name and optional quantity
# steps: 
	# Create new hash key based on item name
	# IF no quantity specified
	if quantity == nil
		# Set quantity to default
		hash[item] = 1
	# ELSE set quantity to specified number
	else
		hash[item] = quantity
	end
# push to the hash 
	hash
# output: hash with newly added item and quantity
end


# Method to remove an item from the list
def remove_item(hash, item)
# input: hash and item name 
# steps:
	# Delete key of item name
	hash.delete(item)
# output: hash with item removed
	hash
end


# Method to update the quantity of an item
def update_list(hash, item, quantity)
# input: hash, item name and new quantity
# steps:
	#check to see if item exists
	# Change the value of the corresponding item key to new quantity
	if hash.has_key?(item)
		hash[item] = quantity
	else puts "ERROR: item does not exist"
	end	
# output: hash with updated quantity
	hash
end

# Method to print a list and make it look pretty
def pretty_list(hash)
# input: hash 
# steps: 
	# Iterate through hash and print string for each key and it's value 
	hash.each { |item, quantity|
		puts "#{item}: #{quantity}"
	}
# output: String with nicely formatted hash data
end

#TEST CODE

list_hash = create_list("lemonade", 1)
update_list(list_hash, "lemonade", 2)
add_list(list_hash, "tomatoes", 3)
add_list(list_hash, "onions", 1)
add_list(list_hash, "ice cream", 4)
update_list(list_hash, "ice cream", 1)
pretty_list(remove_item(list_hash, "lemonade"))