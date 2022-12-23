=begin
Count Binary Substrings

Give a binary string s, return the number of non-empty substrings that have the same number of 0's and 1's, 
and all the 0's and all the 1's in these substrings are grouped consecutively.

Substrings that occur multiple times are counted the number of times they occur.

Example 1:
Input: s = "00110011"
Output: 6
Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: 
"0011", "01", "1100", "10", "0011", and "01".
Notice that some of these substrings repeat and are counted the number of times they occur.
Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.

"0101"

Example 2:
Input: s = "10101"
Output: 4
Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.

Input: A binary string (i.e. a string containing only 0's and 1's)
Output: A number representing the number of substrings within the input string that contain the same number of 0's and 1's, 
with all the 0's and 1's being grouped together. 

Rules: 
  Explicit: For a valid substring, it must contain the same number of 0's and 1's and the 0's and 1's must be grouped together. 
  Implicit: If the input string's length is less than 2, return 0
  - When we know that a substring contains the same number of 1's and 0's, we can determine whether those numbers are grouped
  together by comparing the first half of the number with the second half of the number. If they are different, the 1's and 0's
  must be grouped together. 

Algorithm: 
1. Create an empty array for the substrings. 
2. Find all of the substrings of length 2 or more. 
  a. Iterate from 0 to the length of the string - 2 (start index)
    i. Within that iteration iteration from 2 to the string length - start index (length)
      - Push to the substrings array all string[start index, length]
3. Select those substrings which contain the same number of 0's and 1's. 
4. Select those substrings for which the first half of the string is all 0's or all 1's
5. Return the length of the substrings array. 
=end

def count_binary_substrings(string)
  return 0 if string.length < 2
  
  substrings = []
  
  (0..(string.length - 2)).each do |start_idx|
    (2..(string.length - start_idx)).each do |length|
      substrings << string[start_idx, length]
    end
  end

  substrings.select! do |substring|
    substring.count("0") == substring.count("1")
  end

  substrings.select! do |substring|
    midpoint = substring.length / 2
    substring[0, midpoint].chars.all? {|char| char == "0" } || substring[0, midpoint].chars.all? {|char| char == "1" }
  end

  substrings.length
end

p count_binary_substrings("00110011") == 6
p count_binary_substrings("10101") == 4
p count_binary_substrings("01101100") == 5
p count_binary_substrings("1") == 0