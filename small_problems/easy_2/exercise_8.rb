def sum(int)
  (1..int).to_a.inject(:+)
end

def product(int)
  (1..int).to_a.inject(:*)
end

def valid_integer?(int)
  int.to_i.to_s == int && int.to_i > 0
end

def valid_input?(input)
  input.downcase == "s" || input.downcase == "p"
end

loop do
  number = 0
  loop do
    puts "Please enter an integer greater than 0:"
    number = gets.chomp
    break if valid_integer?(number)
    puts "That is not a valid number."
  end
  number = number.to_i

  input = ""
  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    input = gets.chomp
    break if valid_input?(input)
    puts "Invalid input!"
  end

  if input == "s"
    puts "The sum of the integers between 1 and #{number} is #{sum(number)}."
  elsif input == "p"
    puts "The product of the integers between 1 and #{number} is #{product(number)}."
  end

  puts "Would you like to perform another operation? 'y' to go again"
  answer = gets.chomp
  break unless answer == "y"
end

puts "Thank you!"
