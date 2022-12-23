=begin
Intersection 
Given a 2D integer array nums where nums[i] is a non-empty array 
of distinct positive integers, return the list of integers that 
are present in each array of nums sorted in descending order.

Input: A set of arrays, all containing positive integers only
Output: An array containing the integers which appear in all of the input arrays, 
sorted in descending order. 

Rules:
  Explicit:
    - The number in the input arrays are positive
    - The output array needs to be sorted in descending order
  Implicit:
    - if no number appears in all input arrays, return an empty array. 

Algorithm: 
  1. Create an empty results array. 
  2. Iterate through each of the unique elements in the first array. 
    a. If the element being iterated over is included in all the input arrays, push that 
    item to the results array. 
  3. If results array empty, return it.
  4. Sort the results array in descending order and return it. 
=end

def intersection(array)
  results = []
  array[0].uniq.each do |num|
    results << num if array.all? { |subarr| subarr.include?(num) }
  end

  return results if results.empty?

  results.sort.reverse
end


p intersection([[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]) == [4,3]
p intersection([[1,2,3],[4,5,6]]) == []
p intersection([[2,4,3,5],[1,2,6,5], [3,2,1,5]]) == [5,2]
p intersection([[6,2,4,4],[5,1,1,6],[0,4,7,6]]) == [6]
p intersection([[4,5,3],[2,2,2],[3,4,5]]) == []
