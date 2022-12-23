=begin
Write a method that takes two sorted Arrays as arguments, 
and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. 
You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.
=end

#Input: Two sorted arrays containing integers.
#Output: A single array containing all of the elements from the two input arrays in sorted form 

#Data type: Arrays
#Algorithm: 
  # Create a results array ([])
  # Start two counters at 0, one for the left array and one for the right array
  # Start a loop: 
    # Within the loop, compare the value at index 0 in arr1 with value at index 0 of arr2. 
      # Whichever lower, push into results array and increment counter by 1. 
    # Continue with these comparisons
    # Break when either arr1 counter or arr2 counter is equal to relevant array length (-1). 
  # Outside of loop do ternary operation. 
    # Broken out of loop because array 1 counter == arr1.length - 1? 
      # If true, push numbers from arr2.counter to arr2[-1] into results array. 
      # If false, push numbers from arr1.counter to arr1[-1] into results array.
  # Return results array. 

def merge(arr1, arr2)
  results_array = []
  arr1_counter = 0
  arr2_counter = 0

  return arr2 if arr1.empty?
  return arr1 if arr2.empty?

  loop do
    if arr1[arr1_counter] <= arr2[arr2_counter]
      results_array << arr1[arr1_counter]
      arr1_counter += 1
    else
      results_array << arr2[arr2_counter]
      arr2_counter += 1
    end
    break if arr1_counter == arr1.length || arr2_counter == arr2.length
  end

  arr1_counter == arr1.length ? results_array << arr2[arr2_counter..-1] : results_array << arr1[arr1_counter..-1]

  results_array.flatten
end

p merge([1, 5, 9], [2, 6, 8]) # == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) # == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) # == [1, 4, 5]
p merge([1, 4, 5], []) # == [1, 4, 5]

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end