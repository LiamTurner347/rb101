=begin

Longest common prefix 

Write a method to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

NOTE: a valid prefix is greater than 1 character in length.

Input: An array of strings
Output: A string representing the longest common prefix amongst the strings contained in the input array. 

Rules: 
  - Explicit:
    - A prefix must be greater than 1 character in length
    - If there is no common prefix, return an empty string ""
  - Implicit:
    - There are three strings in the input array

Algorithm: 
  1. Create a result string and set it to empty string
  2. Create a counter and set it equal to 0
  3. Until the character at counter index of string 1 is not equal to the character at counter index of string 2:
    a. Push the character at counter index of string 1 into the result string if the item at counter index of string 2 is equal
    to the item at counter index of string 3
  4. Check whether the length of the result string is greater than or equal to 2. If it is, retirn the result string. If it isn't,
  return empty string. 
=end

def longest_common_prefix(array)
  result = ""
  counter = 0

  until array[0][counter] != array[1][counter] do
    result << array[0][counter] if array[1][counter] == array[2][counter]
    counter += 1
  end

  result.length >= 2 ? result : ""
end


p longest_common_prefix(["house", "home", "hotel"]) == "ho"
p longest_common_prefix(["abc", "def", "hij"]) == ""
p longest_common_prefix(["flower", "flow", "flight"]) == "fl"
p longest_common_prefix(["absolute", "abstract", "absent"]) == "abs"
p longest_common_prefix(["metal", "metallurgy", "metamorphosis"]) == "meta"
p longest_common_prefix(["dog", "racecar", "car"]) == ""
p longest_common_prefix(["aabcd", "aacde", "bdsa"]) == ""
