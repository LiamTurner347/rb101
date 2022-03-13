=begin

PSEUDO-CODE

1. A method that returns the sum of two integers
a) Casual
Given two integers
Add the first integer to the second integer
Save the sum into a new variable
Return the sum variable
b) Formal
START
Given two integers
SET sum = first number + second number
PRINT sum
END

2. A method that takes an array of strings, and returns a string that is all those strings concatenated together
a) Casual
Given an array of strings
Iterate through the array one by one
 - save the first value as the starting value
 - for each iteration, add the next value to the saved value.
 After iterating through the collection, return the saved value. 
b) Formal
START
Given an array of strings called "array"
SET iterator = 1
SET string = value within array at space 1
WHILE iterator <= length of array
 string << value of current iteration
 iterator = iterator + 1
PRINT string
END

3. A method that takes an array of integers, and returns a new array with every other element
from the original array, starting with the first element
a) Casual
Given an array of integers
Iterate through the array one by one
 - select those values where the index + 1 is odd
 - save the selected values into a variable. 
 Return the variable
 b) Formal
 START
 Given an array of integers called "integers"
 SET new_array = values within array where (integers.index + 1) == odd
 PRINT new_array
 END

4. Method that determines the index of the 3rd occurrence of a given character in a string. 
If the given character, does not occur at least 3 times, return nil. 
a) Casual
Given a target character and a string
Split the string up into an array containing each of the characters in the original string
Iterate through the array while count is less than 3
 - If the iterated character is equal to the target character, add 1 to count
 - Otherwise, move to next iteration.
 - If count is equal to three, return the index.
 - If the array is iterated through and count is less than three, return nil. 
b) Formal
START
Given a target character and a string
SET array = split string
SET target character
SET count = 0
SET iterator = 0
WHILE count < 3
  IF string[iterator] = target character
    count + 1
  IF count = 3
    value = string[iterator].index
    break
  iterator + 1
  IF string[iterator].index > (string.length - 1) 
    value = nil
    break
PRINT value

5. Method that takes two arrays of numbers and returns the result of merging the two arrays
a) Casual
Given two arrays of integers
Set a count equal to 0
Set merged array equal to nil
Loop through both arrays and add values to a new merged array
  - Add the value at the first index of the first array to the merged array
  - Add the value at the first index of the first array to the merged array
  - Add 1 to count
  - Loop again through the second index of each array etc
  - Break if count + 1 > the length of the first index
Return merged array
b) Formal
START
Given two arrays of integers
SET count = 0
SET merged array = nil
WHILE count + 1 <= length of first array
  merged array << first array[count]
  merged array << second array[count]
  count + 1
PRINT merged array
END
=end