DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def integer_to_string(integer)
  string = ""
  integer.digits.each { |char| string.prepend(DIGITS[char]) }
  string
end

p integer_to_string(4321) # == '4321'
p integer_to_string(0) # == '0'
p integer_to_string(5000) # == '5000'