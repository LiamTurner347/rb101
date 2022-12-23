# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Input: A string containing uppercase and lowercase letters
# Output: A lowercase letter representing the character that appears the least in the input string (if they are equal, the first one to appear)

# Algorithm: 
  # Split the array up into an array of characters. 
  # Set the result variable equal to the first letter downcased. 
  # Iterate through each character (downcased).
    # If the count of the character being iterated over in the array is less than the count of the result variable: 
      # Set the result variable equal to the character being iterated over. 

def least_common_char(string)
  character_array = string.downcase.chars
  result = character_array.first

  character_array.each do |char|
    result = char if character_array.count(char) < character_array.count(result)
  end

  result
end

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".