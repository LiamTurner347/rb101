=begin
A Rational Number is any number that can be represented as the result of the division between two integers,
e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

A Unit Fraction is a rational number where the numerator is 1.

An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

1   1    1    1
- + - + -- + --
2   3   13   15

Every positive rational number can be written as an Egyptian fraction. For example:

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, 
and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. 
You will need to use the Rational class provided by Ruby.

Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. 
Thus, the first group of examples may not show the same values as your solution. 
They do, however, show the expected form of the solution. 
The remaining examples merely demonstrate that the output of egyptian can be reversed by unegyptian.
=end

#Input for first method: Rational number
#Output: An array of the denominators that are part of an Egyptian fraction representation of the number. 

# Algorithm: 
  # Create a results array
  # Take the rational number.
  # Until the numerator is positive:
    #  Subtract from the rational number given, the largest possible unit fraction - save the unit fraction into an array.
    #  Take the remainder and do this again
  # Map through the results array and for each rational number, return the denominator. Save this into a denominator array. 
  # Return the denominator array

  def egyptian(target_value)
    denominators = []
    unit_denominator = 1
    until target_value == 0
      unit_fraction = Rational(1, unit_denominator)
      if unit_fraction <= target_value
        target_value -= unit_fraction
        denominators << unit_denominator
      end
  
      unit_denominator += 1
    end
  
    denominators
  end

  #Input: An array of numbers representing the denominators for the unit fractions which make up the rational number. 
  #Output: The rational number

  # Algorithm 2:
  # Iterate through each of the denominators and map them to their unit fraction equivalent.
  # Use the inject method to add them together

def unegyptian(denominator_array)
  denominator_array.map{ |denom| Rational(1, denom) }.inject(:+)
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

