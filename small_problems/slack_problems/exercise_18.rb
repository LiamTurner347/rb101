=begin
Longest Good Integer 
You are given a string num representing a large integer. An integer is good if it
meets the following conditions:

   It is a substring of num with length 3.
   It consists of only one unique digit.

Return the maximum good integer as a string or an empty string "" if no such integer exists.

Note:

   A substring is a contiguous sequence of characters within a string.
   There may be leading zeroes in num or a good integer.

Input: A string of integers
Output: A string representing the maximum 'good integer'

Rules:
 a) Explicit:
  - A 'good integer' must be a substring of the input string of length 3 consisting of 
  one unique digit.
  - There may be leading zeroes in num or a good integer. 
b) Implicit: 
  - If there are no good integers, return an empty string. 

Algorithm: 
  1. Create an empty array for all substrings of length three
  2. Create an empty array for all 'good integers'
  3. Iterate from 0 to (string length - 3) - start index
    - Push all substrings from string[stary index, 3] to substrings array
  4. Iterate through each substring 
    - Push it to the good integers array if the count of the value at the first index of the
    substring is 3
  5. Take our good integers array and sort it by transforming to integers. 
  6. Return the last value in the sorted good integers array. 
=end

def largest_good_integer(numstr)
  substrings = []
  good_integers = []

  (0..(numstr.length - 3)).each do |start_idx|
    substrings << numstr[start_idx, 3]
  end
  
  substrings.each do |substring|
    good_integers << substring if substring.count(substring[0]) == 3
  end

  return "" if good_integers.empty?

  good_integers.sort_by! { |int| int.to_i }
  good_integers.last
end

p largest_good_integer('13455587222') == "555"
p largest_good_integer('456987') == ""
p largest_good_integer("11458000") == "000"
p largest_good_integer("111") == "111"
p largest_good_integer("111222333444555666") == "666"
p largest_good_integer("42352338") == ""