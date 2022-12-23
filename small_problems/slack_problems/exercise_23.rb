=begin
Divide a String Into Groups of Size k 
A string s can be partitioned into groups of size k using the following procedure:

   The first group consists of the first k characters of the string, 
   the second group consists of the next k characters of the string, and so on. 
   Each character can be a part of exactly one group.
   For the last group, if the string does not have k characters remaining, 
   a character fill is used to complete the group.

Note that the partition is done so that after removing the fill character 
from the last group (if it exists) and concatenating all the groups in order, 
the resultant string should be s.

Given the string s, the size of each group k and the character fill, 
return a string array denoting the composition of every group s has been divided into, 
using the above procedure.

Example 1:
Input: s = "abcdefghi", k = 3, fill = "x"
Output: ["abc","def","ghi"]
Explanation:
The first 3 characters "abc" form the first group.
The next 3 characters "def" form the second group.
The last 3 characters "ghi" form the third group.
Since all groups can be completely filled by characters from the string, we do not need 
to use fill.
Thus, the groups formed are "abc", "def", and "ghi".

Example 2:
Input: s = "abcdefghij", k = 3, fill = "x"
Output: ["abc","def","ghi","jxx"]
Explanation:
Similar to the previous example, we are forming the first three groups 
"abc", "def", and "ghi".
For the last group, we can only use the character 'j' from the string.
To complete this group, we add 'x' twice.
Thus, the 4 groups formed are "abc", "def", "ghi", and "jxx".

Input: A string, a substring length integer and a fill character. 
Output: An array containing all the substrings of the string which are of the 
substring length integer. Where there are leftover characters, this should be filled 
to the length of the substring length integer using the fill character. 

Algorithm: 
1 Create an empty results array
1. Figure out how many substrings we need to create. 
  a. Length of the input string / substring length integer. 
2. Figure out the length of the remaining string. 
  a. Length of the input string % substring length integer. 
3. If the length of the string is less than the substring length integer, push it to the 
results array. 
4. Else
  number of substrings.times do |start index|
    push to results array the string [start index * 3, 3]
    unless length of remaining string is 0:
        push to results array the string [-remaining string, remaining string]
5. Now we should have our substrings array. 
6. Until length of the string at final index = substring length integer, 
    Push the fill character into the string at final index
7. Return the substrings array. 
=end

def divide_string(string, substr_length, fill_char)
  results = []
  num_substrings = string.length / substr_length
  remainder = string.length % substr_length

  if string.length < substr_length
    results << string
  else
    num_substrings.times do |start_idx|
      results << string[(start_idx * substr_length), substr_length]
    end
    unless remainder == 0 
      results << string[(-remainder), remainder]
    end
  end

  until results[-1].length == substr_length
    results[-1] << fill_char
  end

  results
end


p divide_string("aabbccd", 2, "x") == ["aa", "bb","cc","dx"]
p divide_string("abcdefghij", 3, "x") == ["abc","def","ghi","jxx"]
p divide_string("aa", 3, "x") == ["aax"]
p divide_string("abcdefghi", 3, "x") == ["abc","def","ghi"]
p divide_string("", 2, "x") == ["xx"]
p divide_string("aaa", 1, "x") == ["a","a","a"]