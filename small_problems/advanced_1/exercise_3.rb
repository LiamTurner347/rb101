=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. 
For example:
1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. 
For example, the transposition of the array shown above is:
1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. 
Note that there is a Array#transpose method that does this -- you may not use it for this exercise. 
You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.
Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.
=end

# Input: A 3 x 3 matrix represented by a nested array, containing a set of integers
# Output: A NEW 3 x 3 matrix represented by a nested array, containing a set of integers whereby the rows in the input
 # array have been switched to columns. 

# Example: 
  # 1 is at index[0][0] of the input matrix and we want it to be at index[0][0] of the output matrix
  # 5 is at index[0][1] of the input matrix and we want it to be at index[1][0] of the output matrix
  # 8 is at index[0][2] of the input matrix and we want it to be at index[2][0] of the output matrix
  # 4 is at index[1][0] of the input matrix and we want it to be at index[0][1] of the output matrix
  # 7 is at index[1][1] of the input matrix and we want it to be at index[1][1] of the output matrix
  # 2 is at index[1][2] of the input matrix and we want it to be at index[2][1] of the output matrix

# The clear theme is that we are swapping the nested indices. 

# Algorithm: 
# Set up a new_matrix containing three nested arrays
# Create a counter
# Iterate through each of the subarrays contained in the matrix
# Then iterate through each of the values contained in the subarray (with index)


def transpose(matrix)
  new_matrix = Array.new(3) {Array.new(3)}
  counter = 0

  matrix.each do |sub_arr|
    sub_arr.each_with_index do |num, idx|
      new_matrix[idx][counter] = num
    end
  counter += 1
  end

  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix # == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix # == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# PROVIDED SOLUTION
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end