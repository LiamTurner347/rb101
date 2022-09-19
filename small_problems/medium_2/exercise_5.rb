=begin
A triangle is classified as follows:
  - equilateral All 3 sides are of equal length
  - isosceles 2 sides are of equal length, while the 3rd is different
  - scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, 
and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
=end

#Input: Three integers, each of which signifies the length of a side of a triangle
#Output: A symbol, depending on whether the triangle is invalid, equilateral, isosceles or scalene

# Algorithm
# Take three input values and place them into an array
# Sort the array so the sides are in numerical order from smallest to greatest
# If any of the values in the array are 0 - return :invalid
# If the sum of array[0] and array[1] is not greater than array[2] - return: invalid
# Now, we know we have a valid triangle
# If first item in array equal to last item in array - return: equilateral
# If first item in array equal to second item in array or second item in array equal to third item in array - return: isosceles
# else :scalene

def triangle(side_1, side_2, side_3)
  sides_array = [side_1, side_2, side_3]
  sides_array.sort!

  return :invalid if sides_array.any?(0) || (sides_array[0] + sides_array[1]) <= sides_array[2]

  if sides_array[0] == sides_array[2]
    :equilateral
  elsif sides_array[0] == sides_array[1] || sides_array[1] == sides_array[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid