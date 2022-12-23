=begin
Remove All Adjacent Duplicates In String

You are given a string s consisting of lowercase English letters. 
A duplicate removal consists of choosing two adjacent and equal letters and removing them.

We repeatedly make duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

Input: A string consisting of only lowercase english letters
Output: The final string after all possible duplicate removals have been made. 

Rules: 
  - Explicit: When we find adjacent duplicates in the string, we should remove both. 
  - Implicit: 
    - If the string is length <= 1, return the string. 
    - We want to start at index 0 and compare it to index 1. 
      - If they are the same we should remove both index 0 and index 1. 
        - In this circumstance, we RESET the start index to index 0, try again and compare the new index 0 and index 1. 
      - If they are not the same we compare index 1 and index 2.
        - We continue to do this until the string is empty or until the start index is equal to string length - 1, at which point
          we should break and return the string. 

Algorithm: 
  1. Set a start index at 0
  2. Return the string if the string's length is less than or equal to 1
  3. Split the string into an array of it's characters. 
  4. Until the array is empty or until the start index is equal to array length - 1
    a. Compare the item at the start index with the item at the start index + 1 of the array. 
      i. If they are the same:
        - delete both from the array, using their index. 
        - Reset the start index to 0. 
      ii. If they are different: 
        - add one to the start index 
  5. Return the joined array. 
=end

def remove_duplicates(string)
  start_idx = 0
  
  return string if string.length <= 1

  string_chars = string.chars 

  until string_chars.empty? || start_idx == (string_chars.length - 1)
    if string_chars[start_idx] == string_chars[(start_idx + 1)]
      string_chars.slice!(start_idx, 2)
      start_idx = 0
    else
      start_idx += 1
    end
  end

  string_chars.join
end


p remove_duplicates("aaybbyz") == "z"
p remove_duplicates("a") == "a"
p remove_duplicates("abbca") == "aca"
p remove_duplicates("aabbcc") == ""
p remove_duplicates("aderg") == "aderg"
p remove_duplicates("azxxzy") == "ay"
p remove_duplicates("abbaca") == "ca"
