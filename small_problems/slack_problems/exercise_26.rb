=begin
Reversing an integer means to reverse all its digits.

For example, reversing 2021 gives 1202. Reversing 12300 gives 321 as the leading zeros are not retained.
Given an integer num, reverse num to get reversed1, then reverse reversed1 to get reversed2. 
Return true if reversed2 equals num. Otherwise return false.

Example 1:
Input: num = 526
Output: true
Explanation: Reverse num to get 625, then reverse 625 to get 526, which equals num.

Example 2:
Input: num = 1800
Output: false
Explanation: Reverse num to get 81, then reverse 81 to get 18, which does not equal num.

Example 3:
Input: num = 0
Output: true
Explanation: Reverse num to get 0, then reverse 0 to get 0, which equals num.

Input: A number
Output: A boolean confirming whether the number reversed is the same as the number (with leading zeroes removed)

Algorithm: 
  1. Get the reversed array with leading zeroes - Take the input integer:
    - turn it into a string
    - split it into an array of its characters
    - reverse it
    - iterate through that array and transform each character back into an integer
  2. If the reversed array's length is greater than 1 and the first item in the array is a 0
    - start a loop and inside the loop delete the item at index 0 if it is a 0. 
  3. To get the reverse number, join the reversed array. 
  4. Now to get the second reversed number - take the reversed number: 
    - turn it into string
    - split it into an array of its characters
    - reverse it
    - iterate through that array and transform each character back into an integer
    - join it. 
  5. Compare the second reversed number to the input number. 
=end

def is_same_after_reversals(num)
  reversed_array = num.to_s.chars.reverse.map(&:to_i)
  
  if reversed_array.length > 1 && reversed_array[0] == 0
    loop do
      if reversed_array[0] == 0
        reversed_array.delete_at(0) 
      else
        break
      end
    end
  end

  reverse1 = reversed_array.join

  reverse2 = reverse1.to_s.chars.reverse.map(&:to_i).join

  reverse2.to_i - num == 0
end

p is_same_after_reversals(0) == true
p is_same_after_reversals(11) == true
p is_same_after_reversals(158) == true
p is_same_after_reversals(25879) == true
p is_same_after_reversals(2500) == false
p is_same_after_reversals(11150) == false