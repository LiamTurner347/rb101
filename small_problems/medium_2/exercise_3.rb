=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters,
as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: 
  one represents the percentage of characters in the string that are lowercase letters, 
  one the percentage of characters that are uppercase letters, and 
  one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.
=end

# Input: A string containing lowercase characters, uppercase characters and characters that are neither.
# Output: A hash containing keys for the lowercase, uppercase and neither characters, with the value representing
#   the percentage that the key characters make up when compared to the total characters. 

# Algorithm: 
# Create empty hash
# Split the input string into its characters
# Count the total number of characters
# Count the number of characters that are lowercase
# Count the number of characters that are uppercase
# Count the number of characters that are neither lower or uppercase
# Create key for lowercase, uppercase and neither and set the value equal to (low / upp / neither total).percent_of(total)
# Return hash

def letter_percentages(string)
  percent_hash = {}
  all_chars = string.chars
  total_chars = string.length.to_f

  lower_chars = all_chars.count { |char| char =~ /[a-z]/ }.to_f
  upper_chars = all_chars.count { |char| char =~ /[A-Z]/ }.to_f
  neither_chars = all_chars.count { |char| char =~ /[^A-Za-z]/ }.to_f
  
  percent_hash[:lowercase] = ((lower_chars / total_chars) * 100).round(1)
  percent_hash[:uppercase] = ((upper_chars / total_chars) * 100).round(1)
  percent_hash[:neither] = ((neither_chars / total_chars) * 100).round(1)

  percent_hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('abcdefGHI')
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }