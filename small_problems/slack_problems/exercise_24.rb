=begin
Count Vowel Substrings of a String

A substring is a contiguous (non-empty) sequence of characters within a string.

A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') 
and has all five vowels present in it.

Given a string word, return the number of vowel substrings in word.

Input: A string containing letters only
Output: An integer representing the number of 'vowel substrings' in the input string. 

Rules: 
  Explicit: A substring is a continuous set of characters within the input string
  A vowel substring must have ALL FIVE vowels present in it

Algorithm: 
1. Create a vowels array containing all five vowels
2. Create an empty substrings array
3. Create a counter and set it equal to 0
4. Find all of the substrings in the input string. 
  - Iterate from 0 up to the string length - 5 (start index)
    - Iterate from 1 up to the string length - start index
      -  Push to the vowels array all substrings of length 5 from the start index. 
5. Iterate through the substrings array
  If the substring includes all vowels, add 1 to the counter. 
6. Return the counter
=end

def count_vowel_substrings(string)
  vowels = %w(a e i o u)
  substrings = []
  counter = 0

  (0..(string.length - 5)).each do |idx|
    (1..(string.length - idx)).each do |length|
      substrings << string[idx, length]
    end
  end

  substrings.each do |substring|
    if vowels.all? { |vowel| substring.include?(vowel) } && substring.chars.all? { |char| vowels.include?(char) }
      counter += 1
    end
  end
  
  counter
end

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0

