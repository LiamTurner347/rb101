# If you take a number like 735291, and rotate it to the left, you get 352917. 
# If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. 
# Keep the first 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. 
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
# The resulting number is called the maximum rotation of the original number.
# Note that you do not have to handle multiple 0s.

# Input: An integer
# Output: A new integer which is maximally rotated

# Algorithm:
#  We need a looping mechanism
#  We want to take the input integer and rotate all the characters (i.e. for the full length of the input integer)
#  We now want to take the returned integer and rotate the last (integer length - 1) characters
#  We again want to repeat this but with the last integer length - 2 characters
#  And so on until we rotate the final two digits

def max_rotation(integer)
  (integer.to_s.length).downto(2) do |num|
    integer = rotate_rightmost_digits(integer, num) 
  end
integer
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p max_rotation(735291) # == 321579
p max_rotation(3) # == 3
p max_rotation(35) # == 53
p max_rotation(105) # == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) # == 7_321_609_845

def max_rotation(integer)
  all_digits = integer.to_s.chars
  integer_size = all_digits.size
  0.upto(integer_size - 1) do |index|
    removed = all_digits.delete_at(index)
    all_digits << removed
  end
  all_digits.join.to_i
end