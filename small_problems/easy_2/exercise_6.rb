odd_numbers = (1..99).select { |num| num.odd? }
puts odd_numbers

1.upto(99) { |i| puts i if i.odd? }