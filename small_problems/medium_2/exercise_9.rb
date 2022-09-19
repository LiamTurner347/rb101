=begin
Bubble Sort is one of the simplest sorting algorithms available. 
It isn't an efficient algorithm, but it's a great exercise for student developers. 
In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. 
On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. 
This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. 
Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. 
You may assume that the Array contains at least 2 elements.
=end

# Input: An array of objects
# Output: The same (mutated) array of objects but with the elements sorted in accordance with the sorting principles for the type of object contained in the input array (i.e. string, integer etc)

# Algorithm: 
  # Outer loop 
    # Create a 'changes?' variable that is equal to false
  # Inner loop that runs from index zero to length of the array minus 2 (this is the 'start index')
    # Slice the array from the start index for a length of 2 on each iteration - save into sliced array variable
    # Call <=> on the item at index 0 of the sliced array and the item at index 1 of the sliced array. If that returns '1' THEN
      # Perform parallel assignment on the input array (array[start index], array[start index + 1] = array [start index + 1], array[start index])
      # Set the changes? variable to true
    # else
      # next iteration
  # Again in the outer loop
    # Break if !changes?

def bubble_sort!(array)
  loop do
    changes = false
    n = 0
    1.upto(array.size - (n + 1)) do |index|
      p [array[index - 1], array[index]]
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      changes = true
    end
    n += 1
    break if !changes
  end

  array
end

#array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

