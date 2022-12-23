=begin
Count Operations to Obtain Zero
Easy

You are given two non-negative integers num1 and num2.

In one operation, if num1 >= num2, you must subtract num2 from num1, otherwise subtract num1 from num2.
For example, if num1 = 5 and num2 = 4, subtract num2 from num1, thus obtaining num1 = 1 and num2 = 4. However, if num1 = 4 and num2 = 5, after one operation, num1 = 4 and num2 = 1.

Return the number of operations required to make either num1 = 0 or num2 = 0.

Input: Two positive integers
Output: A number representing the number of operations necessary to make either num1 or num2 = 0

Rules: 
  a) Explicit: 
    - In each operation, it is necessary to subtract one of the two input numbers from the other, depending on which is larger.

Algorithm: 
  a) Set counter equal to 0
  b) Start a loop 
  c) Query whether num 1 greater than or equal to num 2
    - If it is subtract num 2 from num 1
    - Else subtract num 1 from num 2
  d) Add one to the counter 
  e) Return the counter if num 1 equals zero or num 2 equals zero. 
=end

def count_operations(num1, num2)
  counter = 0
  loop do 
    num1 >= num2 ? num1 -= num2 : num2 -= num1
    counter += 1
    return counter if num1 == 0 || num2 == 0
  end
end


p count_operations(4, 4) == 1
p count_operations(10, 10) == 1
p count_operations(4, 3) == 4
p count_operations(2,3) == 3
p count_operations(1, 2) == 2


