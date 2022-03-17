require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)
puts Date.civil(2001, 3, -1)
puts Date.new(2001, 3, -1)
puts Date::ENGLAND