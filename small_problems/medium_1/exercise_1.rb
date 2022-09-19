# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Input: an array of objects (which could be any type)
# Output: a new array of objects but with the first element moved to the last element of the array.

# Algorithm: 
  # create a new array whereby each element is duplicated to avoid mutating the input array
  # remove the first item from the new array
  # concatenate or push that first item to the end of the new array
  # ensure the altered array is returned from the method

def rotate_array(array)
  array = array.map { |el| el.dup }
  first_el = array.shift
  array.push(first_el)
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  string[1..-1] + string[0]
end

p rotate_string("hello") == "elloh"

def rotate_integer(integer) 
  string = integer.to_s
  string = string[1..-1] + string[0]
  string.to_i
end

p rotate_integer(1234) == 2341