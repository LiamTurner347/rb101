SQFEET_TO_SQINCH = 144.0
SQINCH_TO_SQCM = 6.4516

puts "Enter the length of the room in feet:"
length = gets.to_f

puts "Enter the width of the room in feet:"
width = gets.to_f

area_sqf = (length * width).round(2)
area_sqinch = (area_sqf * SQFEET_TO_SQINCH).round(2)
area_sqcm = (area_sqinch * SQINCH_TO_SQCM).round(2)

measurements = <<-MSG
  The area of the room is:
  1. #{area_sqf} square feet; or
  2. #{area_sqinch} square inches; or
  3. #{area_sqcm} square centimetres.
MSG

puts measurements 