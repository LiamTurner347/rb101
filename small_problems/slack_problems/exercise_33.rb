=begin
Vowel Counter

Given a string word, return the sum of the number of vowels ('a', 'e', 'i', 'o', and 'u') in every substring of word.

A substring is a contiguous (non-empty) sequence of characters within a string.

Note: Due to the large constraints, the answer may not fit in a signed 32-bit integer. 
Please be careful during the calculations.


Example 1:
Input: word = "aba"
Output: 6
Explanation:
All possible substrings are: "a", "ab", "aba", "b", "ba", and "a".
- "b" has 0 vowels in it
- "a", "ab", "ba", and "a" have 1 vowel each
- "aba" has 2 vowels in it
Hence, the total sum of vowels = 0 + 1 + 1 + 1 + 1 + 2 = 6.

Example 2:
Input: word = "abc"
Output: 3
Explanation:
All possible substrings are: "a", "ab", "abc", "b", "bc", and "c".
- "a", "ab", and "abc" have 1 vowel each
- "b", "bc", and "c" have 0 vowels each
Hence, the total sum of vowels = 1 + 1 + 1 + 0 + 0 + 0 = 3.

Example 3:
Input: word = "ltcd"
Output: 0
Explanation: There are no vowels in any substring of "ltcd".

input: a string
output: an integer.

rules: method returns the sum of the number of vowels present in every substring in the input word.
if no vowels are include in the input string, return 0.

data structures: arrays
counter = 0
result = []
"aba" -> ["a", "ab", "aba", "b", "ba", and "a".] -> counter += 1 if the current char is a vowel -> 
pass count into result and reset counter for next iteration -> [1,1,2,1,1] -> get the sum -> 6

Algorithm: 
  1. Create an empty substring array
  2. Create a vowels array and set it to include all vowels. 
  3. Set a counter equal to 0
  4. Find all substrings and push into substring array. 
  5. Iterate through each substring in the array. 
    a. Within that iteration, iterate through each char in the substring. 
      i. If the vowels array includes the char, add one to the counter. 
  6. Return the counter
=end

def count_vowels(string)
  substrings = []
  vowels = %w(a e i o u)
  counter = 0

  (0...string.length).each do |start_idx|
    (1..(string.length - start_idx)).each do |length|
      substrings << string[start_idx, length]
    end
  end

  substrings.each do |substring|
    substring.each_char do |char|
      counter += 1 if vowels.include?(char)
    end
  end

  counter
end

p count_vowels("aba") == 6
p count_vowels("abc") == 3
p count_vowels("ltcd") == 0



