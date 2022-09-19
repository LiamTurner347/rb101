# Write a method that takes a string as an argument, 
# and returns true if all parentheses in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Input: string
# Output: boolean, true or false

# Rule: Return true as long as the first bracket is a open bracket AND the total number of open brackets and closed brackets is the same. Else false. 

# Algorithm: 
# Create an empty array
# Split the string into characters and iterate through each character. 
  # If char is open brack or close brack, push to array
# If first character in array is close brack
  # return false
# If number of open bracks not equal to number of close bracks
  # return false
# else true

=begin
def balanced?(string)
  brackets_array = []

  string.each_char do |char|
    brackets_array << char if char == "(" || char == ")"
  end

  if brackets_array.first == ")" || brackets_array.last == "("
    false
  elsif brackets_array.count("(") != brackets_array.count(")")
    false
  else
    true
  end
end
=end

#The above was my solution but there is a simpler method - see below: 

PARENTHESES = {
  "(" => ")",
  "{" => "}",
  "'" => "'",
  "\"" => "\"",
  "[" => "]"
}

def balanced?(string)
  paren = 0

  PARENTHESES.each do |left, right|
    string.chars.each do |char|
      paren += 1 if char == left 
      paren -= 1 if char == right
      return false if paren < 0
    end
  end

  paren.zero?
end


p balanced?("((This)) '{is}' [[balanced]]") == true
p balanced?("But {{{this ]is[ (not) 'balanced'") == false
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false