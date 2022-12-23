def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

# Code not working because we are reassigning the counter parameter in the decrease method and NOT
# the counter variable initialised on line 5. Remember that the variable and parameter are different.

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
