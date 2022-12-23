=begin
Check Zero Ones 
Given a binary string s, return true if the longest contiguous segment of 1's is 
strictly longer than the longest contiguous segment of 0's in s, or return false otherwise.

For example, in s = "110100010" the longest continuous segment of 1s has length 2, 
and the longest continuous segment of 0s has length 3.

Note that if there are no 0's, then the longest continuous segment of 0's is 
considered to have a length 0. The same applies if there is no 1's.

Input: A binary string
Output: A boolean confirming whether the longest continuous segment of 1s is longer than
the longest continuous segment of 0s. 

Rules: 
  If there are no 0s, the longest segment of 0s is 0
  If there are no 1s, the longest segment of 1s is 0
  True is longest segment of 1s longer than longest segment of 0s. False otherwose
  Return false if they are the same length

Algorithm: 
1. Longest one string variable equal to 0
2. Longest zero string variable equal to 0
3. One counter equal to 0
4. Zero counter equal to 0
5. Iterate through each character of the string. 
  a If it's a 1
    - Incrememnt the one counter by 1
    - Longest zero string = zero counter if zero counter longer than longest zerp string
    - zero counter = 0
  b If it's a 0
    - Increment the zero counter by 1
    - Longest one string = one counter if one counter longer than longest one string
    - one counter = 0
6. If character at last item of index is a 1:
  - Longest one string = one counter if ...
  - Else longest zero string = 
7. Query whether one total > zero total
=end

def check_zero_ones(string)
  one_total = 0
  zero_total = 0
  one_counter = 0
  zero_counter = 0

  string.each_char do |char|
    if char == "1"
      one_counter += 1
      zero_total = zero_counter if zero_counter > zero_total
      zero_counter = 0
    else
      zero_counter += 1
      one_total = one_counter if one_counter > one_total
      one_counter = 0
    end
  end

  if string[-1] == "1"
    one_total = one_counter if one_counter > one_total
  else
    zero_total = zero_counter if zero_counter > zero_total
  end

  one_total > zero_total
end

p check_zero_ones("110") == true
p check_zero_ones("0011") == false
p check_zero_ones("1") == true
p check_zero_ones("0") == false
p check_zero_ones("110100010") == false
p check_zero_ones("1101") == true
p check_zero_ones("11010111100") == true

