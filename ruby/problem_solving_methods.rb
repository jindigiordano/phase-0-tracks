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
p search_array(arr, 1)
p search_array(arr, 24)