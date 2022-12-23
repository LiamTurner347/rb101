=begin
Max repeated substring length 
given a string, return the maximum length of a non-empty substring made of a 
single repeated character.

Input: String
Output: A number which represents the longest substring of repeated characters. 

Rules: 
  Explicit: The input string is non-empty
  Implicit: If there are no repeated substrings i.e. no character that repeats at least twice
  return zero. 

Algorithm:
  1. Total variable set to zero
  2. Set a character variable equal to the first character.
  3. Counter variable set to one. 
  4. Iterate from 1 up to string length - 1 (index)
    a. If the item at index is equal to char
      - Add one to counter
    b. If the item at index is not equal to char
      - Set char equal to the item at index
      - Set total equal to counter if counter is more than total
      - Set counter to 1
  5. Set total equal to counter if counter is more than total. 
  6. Query whether total is <= 1. If it is, return 0. Else, return total. 
=end

def max_repeated_substring_length(string)
  total = 0
  character = string[0]
  counter = 1

  (1...string.length).each do |index|
    if string[index] == character
      counter += 1
    else
      character = string[index]
      total = counter if counter > total
      counter = 1
    end
  end

  total = counter if counter > total

  total <= 1 ? 0 : total
end

p max_repeated_substring_length("aappplee") == 3
p max_repeated_substring_length("abbcccddddeeeeedcba") == 5
p max_repeated_substring_length("abcd") == 0
p max_repeated_substring_length("greencode") == 2
p max_repeated_substring_length("rruunn") == 2

