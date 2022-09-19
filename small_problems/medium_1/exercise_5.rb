# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.

# Input: An odd integer
# Output: A diamond of stars

# Algorithm:
#   Get an array containing all the odd numbers from one to the input integer
#   Iterate through each of the numbers in the odd array
#   For each iteration, output:
#     -  space times (input integer - num being iterated over) / 2
#     -  num being iterated over times *
#     -  same as first point above

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(1)

# *

diamond(3)

#   *
#  ***
 #  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *