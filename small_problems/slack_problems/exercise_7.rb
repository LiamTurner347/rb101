=begin
Reverse array 
Write a function that reverses an array, You must reverse the input array in-place without using #reverse or #reverse!.

Input: An array
Output: The SAME array (mutated) with the elements in reverse

Algorithm: 
  - The length of the array times: 
    - pop the final element and unshift / prepend it to the start.
=end

def reverse_arr(array)
  (array.length).times do |index|
    array.insert(index, array.pop)
  end

  array
end


# p reverse_arr(["a","b","c","d"]) == ["d", "c","b","a"]
# p reverse_arr(["h","e","l","l","o"]) == ["o","l","l","e","h"]
# p reverse_arr(["H","a","n","n","a","h"]) == ["h","a","n","n","a","H"]
# p reverse_arr([1,2,3,4,5,6]) == [6,5,4,3,2,1]
# p reverse_arr(["a",1,"b",2]) == [2,"b",1,"a"]

array = [1, 2, 3, 4]
p reverse_arr(array)
p array.object_id == reverse_arr(array).object_id