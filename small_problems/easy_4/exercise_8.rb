DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
}

def string_to_signed_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  digits.delete(nil)

  value = 0
  digits.each { |digit| value = 10 * value + digit }

  if string[0] == "-"
    value = 0 - value
  else
    value
  end
end

p string_to_signed_integer('4321') # == 4321
p string_to_signed_integer('-570') # == -570
p string_to_signed_integer('+100') # == 100