=begin
Common Elements 
Create a method that takes two lists of numbers sorted in ascending order and 
returns an array of numbers which are common to both the input arrays.

Input: Two arrays containing integers, that can be positive or negative (and are sorted in
ascending order)
Output: An array containing the numbers in both arrays, sorted in descending order. 

Algorithm:
  - Create a results array
  - Iterate through each of the numbers in the first array. 
    - If the second array includes the number.
      - Push the number to a results array. 
      - Find the index of the number in the second array
      - Delete the item at the relevant index of the second array. 
  - Take results array and reverse sort it. 
=end

def common_elements(arr1, arr2)
  results = []

  arr1.each do |num|
    if arr2.include?(num)
      results << num
      index = arr2.index(num)
      arr2.delete_at(index)
    end
  end
  
  results.sort.reverse
end

p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [7, 4, 3, 1]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [5, 4, 2, 1]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 2, 4, 5]) == [5, 4, 2, 2, 1]

