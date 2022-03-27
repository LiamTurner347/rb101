def add(one, two)
  one + two
end

def subtract(one, two)
  one - two
end

def multiply(one, two)
  one * two
end

def divide(one, two)
  one / two
end

def modulo(one, two)
  one % two
end

def exponent(one, two)
  one ** two
end

puts "Enter the first number:"
num1 = gets.chomp.to_i

puts "Enter the second number:"
num2 = gets.chomp.to_i

puts "#{num1} + #{num2} = #{add(num1, num2)}"
puts "#{num1} - #{num2} = #{subtract(num1, num2)}"
puts "#{num1} * #{num2} = #{multiply(num1, num2)}"
puts "#{num1} / #{num2} = #{divide(num1, num2)}"
puts "#{num1} % #{num2} = #{modulo(num1, num2)}"
puts "#{num1} ** #{num2} = #{exponent(num1, num2)}"
