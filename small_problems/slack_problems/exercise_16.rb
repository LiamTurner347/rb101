=begin
Digit Sum 
You are given a string s consisting of digits and an integer k.

A round can be completed if the length of s is greater than k. 
In one round, do the following:

Divide s into consecutive groups of size k such that the first 
k characters are in the first group, 
the next k characters are in the second group, and so on. 
Note that the size of the last group can be smaller than k.

Replace each group of s with a string representing the sum of all its digits. 
For example, "346" is replaced with "13" because 3 + 4 + 6 = 13.
Merge consecutive groups together to form a new string. 
If the length of the string is greater than k, repeat from step 1.

Return s after all rounds have been completed.

Example 1:
Input: s = "11111222223", k = 3
Output: "135"
Explanation:
- For the first round, we divide s into groups of size 3: "111", "112", "222", and "23".
 ​​​​​Then we calculate the digit sum of each group: 1 + 1 + 1 = 3, 1 + 1 + 2 = 4, 2 + 2 + 2 = 6, 
 and 2 + 3 = 5.
 So, s becomes "3" + "4" + "6" + "5" = "3465" after the first round.
- For the second round, we divide s into "346" and "5".
 Then we calculate the digit sum of each group: 3 + 4 + 6 = 13, 5 = 5.
 So, s becomes "13" + "5" = "135" after second round.
Now, s.length <= k, so we return "135" as the answer.

Input: A string and an integer
Output: A string integer representing the digit sum. 

Algorithm: 
  1. Jump into a loop
  2. We want to work out how many times to chop up the index:
    a. Do the length of the string / input number
  3. We also want to work out what will be left at the end of the string after we have chopped it up. 
    a. Do the length of the string / input number. 
  4. Create an empty array for our split string
  5. Set a start index equal to 0
  6. x.times: 
    a. slice the string from the start index for a length of the string and place it in the array
    b. set the index equal to the start index += the length of the string
  7. Take the last x character of the string and push it in the array. 
  8. Now we have our first array of characters
  9. Create an array for the sums: 
    a. Iterate through each string of characters, split them into characters, turn them into
     integers and add them together. Then flatten the array. 
  10. Now reassign the string so that it is equal to: 
    a. The value created by iterating through each value in the sums array, turning it into a string and joining them together. 
  11. Break if the length of string is less than ot equal to the input length. 
  12. Return the string. 
=end

def digit_sum(string, k)
  loop do 
    iterations = string.length / k
    remainder = string.length % k
    str_arr = []
    index = 0

    iterations.times do |_|
      str_arr << string[index, k]
      index += k
    end

    str_arr << string[-remainder, remainder]

    sum_arr = str_arr.map(&:chars).map do |sub_arr|
      sub_arr.map do |char|
        char.to_i
      end
    end

    sums = sum_arr.map do |sub_arr|
      sub_arr.inject(:+)
    end

    string = sums.map(&:to_s).join

    break if string.length <= k
  end

  string
end

p digit_sum("123456", 2) == "12"
p digit_sum("11111222223", 3) == "135"
p digit_sum("00000000", 3) == "000"

