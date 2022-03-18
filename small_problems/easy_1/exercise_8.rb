def average(numbers)
  numbers.map! { |n| n.to_f }
  sum = numbers.inject(:+)
  sum / numbers.count
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average([1, 6]) == 3.5 # float division: (1 + 6) / 2 -> 3.5
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])