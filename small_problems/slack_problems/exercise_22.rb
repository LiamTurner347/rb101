=begin
Find Closest Numbers 

Given an integer array nums, return the number with the value closest to 0 in nums. 
If there are multiple answers, return the number with the largest value.

Input: An array of numbers
Output: A number representing the number with the value closest to 0 in nums. 

Rules: 
 a) Explicit: If there are multiple answers, return number with largest value i.e. 

Algorithm: 
 1. Add a 0 into the input array and sort it numerically. 
 2. Find the index of the 0 in the sorted array. 
 3. Set the negative closest variable equal to the index of 0 - 1
 4. Set the positive closest variable equal to the index of 0 + 1
 5. Return positive closest variable if negative closest variable == nil
 6. Return negative closest variable if positive closest variable == nil
 7. If the absolute value of the negative closest variable < the absolute value of the 
 positive closest variable return the negative closest variable. Else, return the positive
 closest variable.
=end

def find_closest_number(array)
  sorted_array = (array << 0).sort!
  index = sorted_array.index(0)
  negative_closest = sorted_array[index - 1]
  positive_closest = sorted_array[index + 1]

  return positive_closest if negative_closest == nil
  return negative_closest if positive_closest == nil

  negative_closest.abs < positive_closest ? negative_closest : positive_closest
end

p find_closest_number([3,7,14,1,-1]) == 1
p find_closest_number([2,5,7,-1]) == -1
p find_closest_number([4,26,10,3]) == 3
p find_closest_number([10]) == 10
p find_closest_number([-4,-2,1,4,8]) == 1

