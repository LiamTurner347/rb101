=begin
Sort Even-Odds 

You are given a 0-indexed integer array nums. Rearrange the values of nums 
according to the following rules:

Sort the values at odd indices of nums in decreasing order.
For example, if nums = [4,1,2,3] before this step, it becomes [4,3,2,1] after. 
The values at odd indices 1 and 3 are sorted in decreasing order.

Sort the values at even indices of nums in increasing order.
For example, if nums = [4,1,2,3] before this step, it becomes [2,1,4,3] after. 
The values at even indices 0 and 2 are sorted in increasing order.

Return the array formed after rearranging the values of nums.

Example 1:
Input: nums = [4,1,2,3]
Output: [2,3,4,1]
Explanation:
First, we sort the values present at odd indices (1 and 3) in decreasing order.
So, nums changes from [4,1,2,3] to [4,3,2,1].
Next, we sort the values present at even indices (0 and 2) in increasing order.
So, nums changes from [4,1,2,3] to [2,3,4,1].
Thus, the array formed after rearranging the values is [2,3,4,1].

Example 2:
Input: nums = [2,1]
Output: [2,1]
Explanation:
Since there is exactly one odd index and one even index, no rearrangement of values 
takes place.
The resultant array formed is [2,1], which is the same as the initial array.

input: an array of integers.
output: a sorted array, with items at odd indices sorted in decreasing order, and items
at even indices sorted in increasing order. 

Algorithm: 
1. Create an empty odd indices array and an empty even indices array
2. Iterate through the input array (with index)
  a. If the item in question is at an odd index, push it to the odd indices array
  b. Else push it to the even indices array. 
3. Sort the odd indices array in decreasing order
4. Sort the even indices array in increasing order. 
5. Zip the two arrays together and flatten them.
=end

def sort_even_odd(arr)
  odd_indices = []
  even_indices = []

  arr.each_with_index do |el, idx|
    idx.odd? ? odd_indices << el : even_indices << el
  end

  odd_indices = odd_indices.sort.reverse
  even_indices.sort!

  even_indices.zip(odd_indices).flatten
end

p sort_even_odd([1,3,5,4]) == [1,4,5,3]
p sort_even_odd([4,1,2,3]) == [2,3,4,1]
p sort_even_odd([2,4,1,78]) == [1,78,2,4]
p sort_even_odd([2,1]) == [2,1]

