=begin

## P: Understanding the Problem

  - Establish the rules / define the boundaries of the problem
    - Assess available information
    - Restate explicit requirements
    - Identify implicit requirements
  - Spend enough time. Don't rush this step.

**General Example**

  Given a string, produce a new string with every other word removed. 

  - Explicit requirements:
    - Input: string
    - Output: new string
    - Remove every other word from input string

  - Questions:
    - What do we mean by every other word? 
    - How do we define a word in this context? 
      - Words are delimited by spaces

## E: Examples and Test Cases

  - Can confirm / refute assumptions
  - Help to answer questions about implicit requirements
  - Act as assertions which help to codify the rules and boundaries of the problem

## D: Data Structures

  - Help to reason with data more logically
  - Help to interact with data at implementation level
  - Thinking in terms of data structures is part of the overall problem solving process
  - Data structures are closely linked to algorithms
      - Set of steps from input to output
        - Involves structuring data in a certain way

## A: Algorithms

  - A logical sequence of steps for accomplishing a task or objective. 
    - Closely linked to data structures
    - Series of steps to structure data to produce the required output
  - Stay abstract / high-level
    - Avoid implementation detail
    - Don't worry about efficiency of algorithm for now

## C: Implementing a solution in Code

  - Translating our solution algorithm to code
  - Think about the algorithm in the context of the programming language
    - Language features and constraints
    - Characteristics and data structures
    - Built in functions / methods
    - Syntax and coding patterns
  - Create test cases
  - Code with intent
  [SEE BOTTOM OF FILE FOR CODE]

**Our Example Problem - Sum Even Number Rows**
  
  Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, 
  with the first row containing one integer, the second row two integers, the third row three integers, 
  and so on. Given an integer representing the number of a particular row, return an integer representing
  the sum of all the integers in that row. 

  **Rules / Requirements**
  - Sequence of even integers
  - Sequence begins with two
  - Integers are consecutive
  - Sequence is grouped in to rows
  - Each row incrementally larger: 1, 2, 3 ...
  - The row number is equal to the number of elements in the row
    - Row 1 has 1 element, row 2 has 2 elements ...
  - Input = a single integer
    - Identifies a 'row', which is a subset of a sequence of integers. 
  - Output = a single integer
    - The sum of the integers in the row identified by the input integer.
    
  - Sequence:
    2, 4, 6, 8, 10, 12, 14, 16, 18, 20...
  - Structure: 
    2
    4, 6
    8, 10, 12
    14, 16, 18, 20
    ...
  
  - How do we create the structure? 

  **Examples**

  row number: 1 --> sum of integers in row: 2
  row number: 2 --> sum of integers in row: 10
  row number: 4 --> sum of integers in row: 68

  **Data Structure**

  - Overall structure represents a sequence as a whole
  - Individual rows within overall structure
  - Individual rows in a set order in context of sequence
  - Individual rows contain integers
  - Integers are in a set order in the context of the sequence

  [
    [2],
    [4, 6],
    [8, 10, 12],
    [14, 16, 18, 20]
    ...
  ]

  Calculating the start integer:
    Rule: First integer of row is equal to the last integer of the preceding row + 2
    Algorithm: 
      - Get the last row of the rows array
      - Get the last integer of that row
      - Add 2 to the integer

  **Algorithm**

  1. Create an empty 'rows' array to contain all of the rows
  2. Create a 'row' array and add it to the overall 'rows' array
  3. Repeat step 2 until all the necessary rows have been created
    - All rows have been created when the length of the 'rows' array is equal to the input integer
  4. Sum final row
  5. Return the sum 

  *Problem: Create a Row*

  Rules
  - Row is an array
  - Array contains integers
  - Integers are consecutive even numbers
  - Integers in each row form part of a larger overall sequence
  - Rows are of different lengths
  - Input: the information needed to create the output
    - The start integer
    - The length of the row
  - Output: The row itself

  Examples: 
  Start: 2, Length: 1 --> [2]
  Start: 4, Length: 2 --> [4, 6]
  Start: 8, Length: 3 --> [8, 10, 12]
  
  Data structures:
  - An array of integers

  Algorithm: 
  1. Create an empty array to contain the integers
  2. Add the starting integer
  3. Increment the starting integer by 2 to get the next integer
  4. Repeat steps 2 and 3 until the array has reached the correct length
    a. Start the loop
      - Add the start integer to the row
      - Increment the start integer by 2
      - Break out of the loop (if length of row equals row length passed into method)
  5. Return the 'row' array

  ## Final Thoughts:
    - Not a completely linear process
    - Move back and forward between steps
    - Switch from implementation mode to abstract problem solving mode when necessary
    - Don't try to problem solve at the code level. 

=end

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2

  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

p sum_even_number_row(1) == 2 #true
p sum_even_number_row(2) == 10 
p sum_even_number_row(4) == 68


