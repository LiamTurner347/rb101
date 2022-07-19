def show_multiplicative_average(array)
  float_ans = ((array.inject(:*).to_f) / array.length).round(3)
  string_ans = sprintf("%.03f", float_ans)
  "The result is #{string_ans}"
end

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', 7.5)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667