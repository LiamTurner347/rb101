=begin
def string_to_integer(string)
  numbers_array = num_str.chars.map do |num|
                    case num
                    when "0" then 0
                    when "1" then 1
                    when "2" then 2
                    when "3" then 3
                    when "4" then 4
                    when "5" then 5
                    when "6" then 6
                    when "7" then 7
                    when "8" then 8
                    when "9" then 9
                    end
                  end
  numbers_array.inject { |a, i| (a * 10) + i }
end

p string_to_integer('4321') # == 4321
p string_to_integer('570') # == 570
=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13,
  'E' => 14, 'F' => 15, 'a' => 10, 'b' => 11, 
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 
}

def hexadecimal_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0

  digits.each_with_index do |digit, index| 
    value += (digit * (16 ** ((digits.length - 1) - index)))
  end

  value
end

p hexadecimal_to_integer('4D9f') # == 19871
