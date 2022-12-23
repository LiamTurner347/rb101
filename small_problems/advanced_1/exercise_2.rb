# Write a method that displays an 8-pointed star in an nxn grid,
# where n is an odd integer that is supplied as an argument to the method. 
# The smallest such star you need to handle is a 7x7 grid.

# Input: An odd integer which is supposed to represent the nxn size grid in which the 8-pointed star is to sit. Smallest value = 7
# Output: An 8-pointed star. 

# Using 7 as an example - we have
# Row 1: Star (2 spaces) Star (2 spaces) (Star)
# Row 2: (Space) Star (space) Star (space) Star (space)
# Row 3: (2 spaces) 3 stars (2 spaces)
# Row 4: 7 stars
# Row 5: - same as rows 1 to 3 but reversed. 

# Middle row is always going to be n stars
# Above we go from 0 to (n - 3) / 2 (index) (n-3 / 2 times)
  # Place three stars with n spaces in between them - centred in n spaces
# Rows either side of middle row is always going to be 3 stars centred with (n-3) / 2 spaces either side
# Then we have (n-3) / 2 rows above and below
# Design top section
# Middle row
# Bottom section

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

star(7)
star(9)

=begin
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
=end