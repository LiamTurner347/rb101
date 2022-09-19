=begin
A triangle is classified as follows:
  - right: One angle of the triangle is a right angle (90 degrees)
  - acute: All 3 angles of the triangle are less than 90 degrees
  - obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid 
depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.
=end

# Input: Three integers - each of which is supposed to represent an angle
# Output: A symbol depending on whether the triangle is invalid, right angled, acute or obtuse

# Algorithm:
# Create an array and place each of the input integers into it. Sort them. 
# Test for whether the triangle is valid: 
  # Return :invalid if array includes 0 OR sum of values in array not equal to 180
# Now we know it is valid: 
  # Return :right if array includes 90
  # Return :obtuse if last value greater than 90
  # Else return :acute

def triangle(angle_1, angle_2, angle_3)
  angles_array = [angle_1, angle_2, angle_3].sort!
  
  return :invalid if angles_array.include?(0) || angles_array.inject(:+) != 180

  if angles_array.include?(90)
    :right
  elsif angles_array.last > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid