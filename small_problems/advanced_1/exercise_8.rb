=begin
Sort an array of passed in values using merge sort. 
You can assume that this array may contain only one type of data. 
And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays,
then recombining those nested sub-arrays in sorted order. It is best shown by example. 

For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

Feel free to use the merge method you wrote in the previous exercise.
=end

#Input: A single array containing any number of elements - the elements will either all be number or all be strings so they are all comparable with each other. 
#Output: A NEW sorted array which has been sorted using the merge sort procedure set out above. 

# Algorithm: 
  # There may be an array 
  # If input array only contains one value, it is already sorted - return the input array. 
  # Divide the list recursively into two halves until it can no longer be divided. 
  # Merge the smaller lists into new lists in sorted order until the array is flat again. 

def merge_sort(array)
  return array if array.size == 1

  half_elements = (array.size / 2).round
  left_array = array.take(half_elements)
  right_array = array.drop(half_elements)

  sorted_left = merge_sort(left_array)
  sorted_right = merge_sort(right_array)

  merge(sorted_left, sorted_right)
end

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

# merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) # == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
