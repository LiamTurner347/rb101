=begin
A’s before B’s? 
Given a string s consisting of only the characters 'a' and 'b', 
return true if every 'a' appears before every 'b' in the string. Otherwise, return false.

Input: String containing only a's and b's
Output: A boolean confirming whether all of the a's appear before all of the b's

Rules: 
  Explicit: There won't be any characters other than a and b in the input string
  Implicit: There may be no a's and there may be no b's.
   - If there are no a's, return false

Algorithm: 
  1. Return false if the input string does not include an a
  2. Return true if the sorted string is the same as the input string. False otherwise.
=end

def check_string(string)
  return false if !string.chars.include?("a")

  string.chars.sort.join == string
end

p check_string("aba") == false
p check_string("aaa") == true  
p check_string("aabb") == true
p check_string("abab") == false
p check_string("aaabbb") == true
p check_string("bbb") == false