=begin
Move Zeroes 
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.

Example 1:
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]

Example 2:
Input: nums = [0]
Output: [0]

Input: An array of numbers.
Output: The same array (object_id) of numbers with all zeroes in the array moved to the end. 

Explicit rules: 
  - The array returned must be the same array with the same object id
  - The other (non-zero) items in the array should be in the same order. 
Implicit rules: 
  - An array with no zeroes should be unchanged. 

Algorithm: 
  1. Set a count equal to the number of zeroes in the input array. 
  2. Delete all zeroes from the input array using the delete method
  3. Count no. times, push 0 to the array
  4. Return the array
=end

def move_zeroes(nums)
  count = nums.count(0)
  nums.delete(0)
  count.times do |_|
    nums << 0
  end

  nums
end


p move_zeroes([0,12,3,0,4]) == [12,3,4,0,0]
p move_zeroes([0]) == [0]
p move_zeroes([0,1,0,3,12]) == [1,3,12,0,0]
p move_zeroes([3,0,9,0,1,20,0,1]) == [3,9,1,20,1,0,0,0]
p move_zeroes([4,2,4,1,3]) == [4,2,4,1,3]

arr = [0, 1, 0, 2, 2, 3]
p move_zeroes(arr)
p arr.object_id == move_zeroes(arr).object_id

