=begin
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow 
and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; 
as a result, the Fibonacci solution is only useful up to about fibonacci(40). 
With higher values of nth, the recursive solution is impractical. 
(Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.
=end

# Input: A number which is supposed to represent the nth fibonacci number
# Output: The fibonacci number which is at position n (input number)

# Example: Fibonacci(5)
# [1, 1, 2, 3, 5]
# (n-2).times { |_| array << (array [-2] + array [-1])}
# array.last

# Algorithm: 
 # Build up an array containing the fibonnaci numbers
 # We know the first two fibonacci numbers are 1. 
 # Create a fibonacci array containing the first two numbers [1, 1]
 # As we know the first two numbers, we want to iterate input number - 2 times
 # On each iteration, we want to add the next fibonacci number to the fibonacci array. 
  # We can do this by pushing the addition of array[-2] + array[-1] to the array. 
# Finally, we want to return the last value in the array which corresponds with the nth fibonacci number. 

def fibonacci(n)
  fibonacci = [1, 1]

  (n - 2).times do |_|
    fibonacci << (fibonacci[-2] + fibonacci[-1])
  end

  fibonacci.last
end

p fibonacci(20) # == 6765
p fibonacci(100) # == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end