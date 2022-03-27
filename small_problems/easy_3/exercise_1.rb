words_array = %w(1st 2nd 3rd 4th 5th last)
numbers_array = []

6.times do |n|
  puts "Enter the #{words_array[n]} number:"
  numbers_array << gets.chomp.to_i
end

if numbers_array[0..4].include?(numbers_array[5])
  puts "The number #{numbers_array[5]} appears in #{numbers_array[0..4]}."
else
  puts "The number #{numbers_array[5]} does not appear in #{numbers_array[0..4]}."
end
