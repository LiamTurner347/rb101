DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def integer_to_string(integer)
  string = ""
  integer.digits.each { |char| string.prepend(DIGITS[char]) }
  string
end

def signed_integer_to_string(integer)
  string = integer_to_string(integer.abs)

  case integer <=> 0
  when 1  then "+#{string}"
  when -1 then "-#{string}"
  else          string
  end
end     

p signed_integer_to_string(4321) # == '+4321'
p signed_integer_to_string(-123) # == '-123'
p signed_integer_to_string(0) # == '0'