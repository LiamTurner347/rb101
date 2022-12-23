=begin
You are given an array of integers nums. You are also given an integer original which is the first number that 
needs to be searched for in nums.

You then do the following steps:
If original is found in nums, multiply it by two (i.e., set original = 2 * original).
Otherwise, stop the process.
Repeat this process with the new number as long as you keep finding the number.
Return the final value of original.


Example 1:
Input: nums = [5,3,6,1,12], original = 3
Output: 24
Explanation:
- 3 is found in nums. 3 is multiplied by 2 to obtain 6.
- 6 is found in nums. 6 is multiplied by 2 to obtain 12.
- 12 is found in nums. 12 is multiplied by 2 to obtain 24.
- 24 is not found in nums. Thus, 24 is returned.

Example 2:
Input: nums = [2,7,9], original = 4
Output: 4

Input: An array of integers and an integer. 
Output: An integer representing the number landed on when following the process in the method. 

Rules: 
  - Explicit: 
    - Take the original number. If it is in the array, double it and research the array. If not, return it. 
  - Implicit: 
    - When we're dealing with zeroes, we're going to have to find a way to remove the item from the array. 

Algorithm: 
1. Set up a loop. Within the loop: 
  a. If the array includes the num: 
    i. do num * 2
    ii. find the index of num in array. 
    iii. delete the item at the relevant index from the array so it can't be used again. 
  b. Else
    i. Return num. 
=end 

def find_final_value(array, num)
  loop do 
    if array.include?(num)
      index = array.index(num)
      array.delete_at(index)
      num *= 2
    else 
      return num
    end
  end
end


p find_final_value([5,4,7], 1) == 1
p find_final_value([5], 5) == 10
p find_final_value([5,3,6,1,12], 3) == 24
p find_final_value([0,0,0], 0) == 0
p find_final_value([5,7,8,0], 0) == 0
