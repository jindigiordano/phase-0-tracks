# Define method for searching an array for an integer
def search_array(array, int) 
	# initialize var to output index
	ind = nil
	# initialize count var to keep track of index every iteration
	count = 0
	# iterate through array to output index if item = integer
	array.each { |i| 
		if i == int
			ind = count
		end
		# increment index every time we loop
		count += 1
	}
	# return the index
	ind
end

# array to test with
arr = [42, 89, 23, 1]

# test calls
# p search_array(arr, 1)
# p search_array(arr, 24)


# Define method to output num of Fibonacci numbers given
def fib(num)
	# Set up the first two nums in fib array
	fib_arr = [0, 1]
	# To add more nums in array, add the prev two
	# Add on num - 2 more items in array (first two already given)
	(num - 2).times {
		# Add prev two numbers, push sum into array
		new_num = fib_arr[-1] + fib_arr[-2]
		fib_arr << new_num
	}
	fib_arr
end

# p fib(6)
# p fib(100)


# Pseudocode a sorting method that takes array, returns sorted array
def my_sorting_method(array)
	array.length.times {
	# Initialize number of times to loop
	looped = 0
	# Set a condition so it's not an infinite loop
	# Loop only as many times as items in array
	while looped < array.length
		# Check if item is greater than it's => neighbor
		# Edge case for last item you can't compare with => neighbor
		if looped == array.length - 1
			break
		# For all items that are not the last item
		elsif array[looped] > array[looped + 1]
			# If it's greater, swap with => neighbor
			array[looped], array[looped + 1] = array[looped + 1], array[looped]
		end
		# Increment loop counter
		looped += 1
	end
	}
	array
end

arr = [20, -3, -10, -9, -20]

p my_sorting_method(arr)