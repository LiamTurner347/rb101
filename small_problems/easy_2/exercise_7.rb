even_numbers = (1..99).select { |num| num.even? }
puts even_numbers

1.upto(99) { |i| puts i if i.even? }