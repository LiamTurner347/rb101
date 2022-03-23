puts "What is the bill?"
bill = gets.to_f
puts "What is the tip percentage?"
percentage = gets.to_f

percentage_decimal = percentage / 100
tip = (bill * percentage_decimal).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"