puts "What is your age?"
age = gets.to_i 
puts "At what age would you like to retire?"
retire_age = gets.to_i

current_year = Time.now.year 
time_to_retire = retire_age - age
retire_year = current_year + time_to_retire

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{time_to_retire} years of work to go!"
