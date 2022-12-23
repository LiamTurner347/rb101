=begin
First Unique Character 
Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

Input: A string
Output: A number representing the integer of the first character in the input string that is not repeated elsewhere
in that input string (i.e. there is only one of them)

Rules: 
  Explicit rules are: If there is no character that is not repeated elsewhere in the string, return -1 
  Implicit rule: The repetition does not have to be immediately after - as long as it is repeated somewhere in the string. 
   - What we are really looking for is the first character which only appears once in the string. 

Algorithm: 
1. Create an array containing the unique characters in the input string. 
2. Iterate through each character in that array
  - If the count of that character in the input string is 1, return its index. 
3. After iteration, if no index returned, return - 1
=end

def first_uniq_char(s)
  characters = s.chars.uniq
  characters.each do |char|
    return s.index(char) if s.count(char) == 1
  end
  -1
end


p first_uniq_char("") == -1
p first_uniq_char("aabccde") == 2
p first_uniq_char("rainbow") == 0
p first_uniq_char("eeaatt") == -1
p first_uniq_char("lovelettuce") == 1
p first_uniq_char("aabb") == -1

