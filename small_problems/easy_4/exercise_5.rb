def multisum(number)
  multiples_array = []

  for n in 1..number do
    multiples_array << n if n % 3 == 0 or n % 5 == 0
  end

  multiples_array.inject(:+)
end

p multisum(3) # == 3
p multisum(5) # == 8
p multisum(10) # == 33
p multisum(1000) # == 234168
