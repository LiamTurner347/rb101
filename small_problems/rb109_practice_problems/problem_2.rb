# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Input: An array of integers
# Output: The minimum sum of 5 consecutive numbers in the array

# Example: 
  # [55, 2, 6, 5, 1, 2, 9, 3, 5, 100]
      # 55, 2, 6, 5, 1
      # 2, 6, 5, 1, 2
      # 6, 5, 1, 2, 9
      # 5, 1, 2, 9, 3
      # 1, 2, 9, 3, 5
      # 2, 9, 3, 5, 100
      # Array is length 10 and there are 6 different possible arrays. 

# Algorithm: 
  # Return nil if array length < 5
  # (Array length - 4) times, do
    # Create a variable containing the sub-arrays
      # Take a slice of 5 items (using the counter, 5) array[counter, 5]
      # Push them into the sub-arrays
    # Iterate through the sub-arrays and add the values up using inject.
    # Flatten the array, sort it and return the first value in the array as that will be the lowest. 

def minimum_sum(array)
  return nil if array.length < 5
  sub_arrays = []

  (array.length - 4).times do |counter|
    sub_array = array[counter, 5]
    sub_arrays << sub_array
  end

  sub_arrays.map { |sub_arr| sub_arr.inject(:+) }.flatten.sort.first
end

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".