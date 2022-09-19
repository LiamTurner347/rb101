# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Input: A number
# Output: A number that represents the difference between: 
  # (a) the square of the sum of the values from 1 to the input number;
  # (b) the sum of the squares of the values from 1 to the input number. 

# Algorithm: 
  # Create an array that contains all the values from 1 to the input number
  # Calculate the square sum of the values from 1 to the input number
    # Calculate the sum of the values from 1 to the input number
    # Square the return value
    # Save into variable i.e. square value one
  # Calculate the sum of the squares of the values from 1 to the input number. 
    # Create a counter set to 0
    # Iterate through each of the values in the array
    # Square each value and add it to the counter
    # Save the final counter into a variable i.e. square value two
  # Difference = square value one - square value two. Return absolute value using abs method. 
  # Return difference

def sum_square_difference(input_num)
  numbers_arr = []
  1.upto(input_num) { |num| numbers_arr << num }
  
  square_value_one = (numbers_arr.inject(:+)) ** 2
  
  square_value_two = 0
  numbers_arr.each do |num|
    square_value_two += num ** 2
  end
  
  (square_value_one - square_value_two).abs
end

p sum_square_difference(3) # == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) # == 2640
p sum_square_difference(1) # == 0
p sum_square_difference(100) # == 25164150

def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end