def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end

=begin
def reversed_number(number)
  rev_arr = []

  number.to_s.chars.reverse_each do |char|
    rev_arr << char.to_i
  end

  loop do
    rev_arr.shift if rev_arr.first == 0
    break if rev_arr.first != 0
  end

  rev_arr.join
end
=end

p reversed_number(12345) # == 54321
p reversed_number(12213) # == 31221
p reversed_number(456) # == 654
p reversed_number(12000) # == 21 # No leading zeros in return value!
p reversed_number(12003) # == 30021
p reversed_number(1) # == 1