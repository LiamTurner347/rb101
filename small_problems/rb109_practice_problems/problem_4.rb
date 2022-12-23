# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Input: An array of numbers
# Output: An array containing the two integers in the input array that are closest together in value. 

# Algorithm: 
  # Sort the input array
  # Save the sets of two integers into a variable. Iterate through each of them. 
    # Map the differences between the two (second item in array minus first item) into a new variable for differences. 
    # Sort the differences. 
  # Now sort the differences. 
  # Iterate through the doubles to find the one with the smallest difference. Save the pair into a new array and flatten. 
  # Iterate through the original array 
    # If equals doubles [1], save into results array
    # If equals doubles [2], save into results array.

def closest_numbers(array)
  sorted_array = array.sort
  doubles = []
  prelim_result = []
  result = []

  (array.length - 1).times do |n|
    doubles << sorted_array[n, 2]
  end

  differences = doubles.map do |sub|
    sub[1] - sub[0]
  end

  doubles.each do |sub|
    prelim_result << sub if sub[1] - sub[0] == differences.sort.first
  end

  array.each do |n|
    result << n if n == prelim_result[0][0] || n == prelim_result[0][1]
  end

  result
end

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".