=begin
Is Subsequence 

Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting 
some (can be none) of the characters without disturbing the relative positions of the remaining 
characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

Example 1:
Input: s = "abc", t = "ahbgdc"
Output: true

Example 2:
Input: s = "axc", t = "ahbgdc"
Output: false

Input: Two strings
Output: A boolean confirming whether the first string is a 'subsequence' of the second string

Rules: 
 - Explicit:
    - A subsequence of a string is formed by the original string where some or none of the characters in the original string
    have been deleted without disturbing the position of the characters in the original string. 
 - Implicit:

 Algorithm: 
  1. Create a result string = ""
  2. Create a counter and set it equal to 0
  3. Iterate through each character in the second string
    a. If the character iterated over in the second string is the same as the character at counter index of the first string: 
      Push the character iterated over to the result string
      Increment the counter index by 1
  4. Query whether the result string is equal to the first input string. 
=end

def is_subsequence(s, t)
  result = ""
  counter = 0

  t.each_char do |char|
    if char == s[counter]
      result << char
      counter += 1
    end
  end

  result == s
end

p is_subsequence("aabb", "aabb") == true
p is_subsequence("aaa", "abacba") == true
p is_subsequence("bbb", "abcde") == false
p is_subsequence("axcd", "abxcd") == true
p is_subsequence("axc","ahbgdc") == false
p is_subsequence("abc","ahbgdc") == true
p is_subsequence("abc","ahbgdc") == true
p is_subsequence('abc','aabbcc') == true
p is_subsequence('aec','abcde') == false
