=begin
Find Max Consecutive Ones  
Given a binary array nums, return the maximum number of consecutive 1's in the array.

Input: An array of binary numbers i.e. 1s and 0s
Output: A number representing the maximum number of consecutive 1s in the array. 

Algorithm: 
1. Create a total variable and set it equal to 0
2. Create a counter variable and set it equal to 0
3. Iterate through each value in the array. 
  - If the value is a 1
    - Increment counter by 1
  - Else
    - Set total equal to counter if counter is greater than total. 
    - Reset counter to 0
4. Once the loop ends, again set total equal to counter if counter is greater than total. 
5. Return total 
=end

def find_max_consecutive_ones(nums)
  total = 0
  counter = 0
  nums.each do |num|
    if num == 1
      counter += 1
    else
      total = counter if counter > total
      counter = 0
    end
  end

  total = counter if counter > total
  total
end

p find_max_consecutive_ones([1,1,0,0,1,0]) == 2
p find_max_consecutive_ones([0,1,0,1,1,0,1,1,1]) == 3
p find_max_consecutive_ones([0,0,0]) == 0
p find_max_consecutive_ones([0,1,0]) == 1
p find_max_consecutive_ones([1,0,1,1,0,1]) == 2
p find_max_consecutive_ones([1,1,0,1,1,1]) == 3

