=begin
Longest Palindromic Substring 
Given a string s, return the longest palindromic substring in s.

A single character is not considered a palindromic substring.

# Input: A string
# Output: A string representing the longest palindromic substring in the input string. 

# Rules:
  # Explicit: 
    - A single character is not considered to be palindromic
    - A palindrome is a word which is the same in reverse
  # Implicit:
    - If there are no palindromic substrings return an empty string. 

# Algorithm: 
  # Create a variable to hold the longest palindrome / result string and set that equal to ""
  # Create an empty array to hold all substrings
  # Push all of the substrings of length 2 or more in the input string into that empty array
    # Example: String "abcd"
      - "ab" "abc" "abcd"
      - "bc" "bcd"
      - "cd"
      First index we want to go from 0 to string length - 2
      Length of the string is going to be from 2 to string length - index 1
    # Create an outer loop that runs from 0 to string length - 2
    # Create an inner loop that runs from 2 to string length - index 1
      # Within that inner loop push the substrings from [index 1, length] into the substrings array
  # Iterate through that array of substrings:
    # Determine whether the substring iterated over is a palindrome
    # If it is and the length of that substring is greater than the result variable, set the result variable equal to that string
  # Return the result variable
=end

def longest_palindrome(s)
  result = ""
  substrings = []
  (0..(s.length - 2)).each do |idx1|
    (2..(s.length - idx1)).each do |length|
      substrings << s[idx1, length]
    end
  end

  substrings.each do |substring|
    result = substring if substring == substring.reverse && substring.length > result.length
  end

  result
end

p longest_palindrome("babad") == "bab"
p longest_palindrome("cbbd") == "bb"
p longest_palindrome("abcd") == ""
p longest_palindrome("aa") == "aa"
p longest_palindrome("12231221") == "1221"

