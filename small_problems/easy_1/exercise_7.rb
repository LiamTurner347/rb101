def stringy(size, start=1)
  numbers = []

  if start == 0
    size.times do |index|
    number = index.even? ? 0 : 1
    numbers << number
    end
  else
    size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
    end
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(5, 0) == '01010'