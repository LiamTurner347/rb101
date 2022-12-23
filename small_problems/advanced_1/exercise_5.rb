=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

A 90-degree rotation of a matrix produces a new matrix in which 
each side of the matrix is rotated clockwise by 90 degrees. 
For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5

is:

9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.
=end

#Input: A nested array
#Output: A nested array with the values rotated 90 degrees

#Example:
 # Value 1 is an index[0][0] of the input array and index [0][2] of the output array
 # Value 5 is at index [0][1] of the input array and index [1][2] of the output array
 # Value 8 is at index [0][2] of the input array and index [2][2] of the output array
 # Value 4 is at index [1][0] of the input array and index [0][1] of the output array
 # Value 7 is at index [1][1] of the input array and index [1][1] of the output array
 # Value 2 is at index [1][2] of the input array and index [2][1] of the output array
  # Value 3 is at index [2][0] of the input array and index [0][0] of the output array
 # Value 9 is at index [2][1] of the input array and index [1][0] of the output array
 # Value 6 is at index [2][2] of the input array and index [2][0] of the output array

 # Basically: 
  # The first column becomes the first row (in reverse)

#Algorithm:


def rotate90(matrix)
  result = []
  number_of_rows = matrix.length
  number_of_columns = matrix.first.length

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }.reverse
    result << new_row
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
