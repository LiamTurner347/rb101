=begin
Sort Pairs 
# Given a array, swap every two adjacent elements and return the re sorted array. 
You must solve the problem without modifying the values in the array's elements 
(i.e., only elements themselves may be changed.)

# Given an array and returns an array where each element is swapped with 
the adjacent element.

Input: An array of elements
Output: An array of elements where each adjacent element pair has been swapped. 

Rules: 
a) Explicit: 
  You cannot modify the values in the array's elements - only the elements themselves can
  be changed. 
b) Implicit: 
  Where the array length is less than 2, return the input array. 
  The array will always be of even length. 

Algorithm: 
  1. If input array length < 2, return input arr
  2. Create a left index and set it equal to 0
  3. Create a right index and set it equal to 1
  4. Until the right index equals the length of the input array - 1
    - Perform parallel assignment and swap the left index with the right index. 
    - Add 2 to the left index
    - Add 2 to the right index. 
  5. Return the amended array. 
=end

def sort_pairs(arr)
  return arr if arr.length < 2

  left_idx = 0
  right_idx = 1
  
  until right_idx >= arr.length
    arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
    left_idx += 2
    right_idx += 2
  end

  arr
end

p sort_pairs([1,2,3,4]) == [2,1,4,3]
p sort_pairs([]) == []
p sort_pairs([1]) == [1]
p sort_pairs([4,6,8,10,4,12]) == [6,4,10,8,12,4]

