=begin
Write a method that takes a string argument, and returns 
true if all of the alphabetic characters inside the string are uppercase, false otherwise. 
Characters that are not alphabetic should be ignored.
=end

# Input: a string
# Output: a boolean returning true if all alphabetic characters are uppercase, false otherwise. 

def uppercase?(string)
  string.chars.all? { |char| char == char.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true