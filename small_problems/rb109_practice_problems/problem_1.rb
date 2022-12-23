# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Input: An array of numbers
# Output: An array of numbers showing how many numbers in the input array are smaller than the corresponding value in the input array.

# Algorithm:
 # Create a results array []
 # Create a counter and set it to zero
 # Iterate through each of the numbers in the input index
  # Create a unique version of the array and iterate through each of those items:
    # If the item is smaller than the top-level number, counter += 1
# results array << counter
# return results array

def smaller_numbers_than_current(array)
  results_array = []
  array.each do |num_1|
    counter = 0

    array.uniq.each do |num_2|
      counter += 1 if num_2 < num_1
    end
  
    results_array << counter
  end

  results_array
end

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            # == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".