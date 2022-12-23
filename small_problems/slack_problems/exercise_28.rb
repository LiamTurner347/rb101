=begin
Largest Substring Between Two Equal Characters

Given a string s, return the length of the longest substring between two equal characters, 
excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

Input: A string
Output: The length of the longest string between two equal character in the input string. 

Algorithm: 
1. Split the substring into an array of all possible substrings.
  - Iterate from 0 up to string length - 2 (start index)
    - Iterate from 2 up to string length - start index (length)
     - Push string[start index, length] to the substrings array. 
2. Iterate through the substring array and select those arrays for which the first letter equals the last letter. 
3. If the array is empty return -1
4. Otherwise sort the array by substring length. 
5. Return the length of the last item in the array - 2.
=end

def max_length_between_equal_characters(string)
  substrings = []

  (0..(string.length - 2)).each do |start_idx|
    (2..(string.length - start_idx)).each do |length|
      substrings << string[start_idx, length]
    end
  end

  substrings.select! { |substring| substring[0] == substring[-1] }

  return -1 if substrings.empty?

  substrings.sort_by! { |substring| substring.length }

  ((substrings[-1].length) - 2)
end

p max_length_between_equal_characters("acbsewb") == 3
p max_length_between_equal_characters("acbsewba") == 6
p max_length_between_equal_characters("aa") == 0
p max_length_between_equal_characters("cbzxy") == -1


