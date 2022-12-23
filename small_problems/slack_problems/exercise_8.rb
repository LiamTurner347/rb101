=begin
Word Pattern 

Given a pattern and a string s, find if s follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

Example 1:
Input: pattern = "abba", s = "dog cat cat dog"
Output: true

Example 2:
Input: pattern = "abba", s = "dog cat cat fish"
Output: false

Example 3:
Input: pattern = "aaaa", s = "dog cat cat dog"
Output: false

Input: A pattern and a word(s) (both in the form of a string)
Output: Boolean depending on whether or not the pattern matches the words. 

Rules: 
  Explicit: 
    - Each letter in the pattern is supposed to relate to a word
    - A full match requires all of the words in the string to match the order of the letters in the pattern. 
  Implicit: 
    - If we have an empty pattern and an empty string, that should return true. 

Algorithm: 
  1. Create an empty results array
  2. Create an empty dictionary hash to store the pattern as a key and its associated word as a value. 
  3. Split both the pattern and the string into arrays (with the pattern being an array of characters and the string being an array of words)
  4. Find the unique values in the pattern array. 
  5. For each of those unique values
      - Find its first index in the pattern string.
      - Match that against the index of the word in the second string
      - Save the pattern as a key with the associated word as a value. 
  6. We should have a dictionary containing all of the characters in the pattern as keys and its associated word as a value. 
  7. Iterate through each value in the pattern. 
    - For each value (which is a key in the dictionary hash), place its associated value in the results array. 
  8. Join the results array and query whether it is equal to the second string inputted. If it is, true. If not, false. 
=end

def word_pattern(pattern, s)
  results = []
  dictionary = {}
  pattern_array = pattern.chars 
  word_array = s.split

  unique_values = pattern_array.uniq
  unique_values.each do |value|
    word = word_array[pattern_array.index(value)]
    dictionary[value] = word
  end

  pattern_array.each do |value|
    results << dictionary[value]
  end

  results.join(" ") == s
end


p word_pattern("aa", "aaa") == false
p word_pattern("abba", "dog cat cat dog") == true
p word_pattern("abba", "dog cat cat fish") == false
p word_pattern("abbc", "dog cat cat fish") == true
p word_pattern("","") == true
p word_pattern("abcdefbag", "this is a scalable test case is this true") == true
p word_pattern("aaaa", "dog cat cat dog") == false



