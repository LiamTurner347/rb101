# Write a method that can rotate the last n digits of a number. 
# You may assume that n is always a positive integer

# Input: An integer and a number which represents the rightmost 'n' digits which are to be rotated
# Output: A new integer with the rightmost 'n' digits rotated 

# Algorithm:  
  # Change the input integer into a string
  # Split the string into the last 'n' characters and the first 'string length - n' characters
  # Rotate the last 'n' digits
  # Concatenate the first digits with the rotated last 'n' digits
  # Transform the concatenated string into an integer and return it

def rotate_rightmost_digits(integer, num)
  string = integer.to_s
  rotate_chars = string.slice!(-num..-1)
  (string + rotate_string(rotate_chars)).to_i
end

def rotate_string(string) 
  string[1..-1] + string[0]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917 