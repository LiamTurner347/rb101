def century(number)
  century = (number.to_f / 100).ceil.to_s

  if century.end_with?("11") || century.end_with?("12") || century.end_with?("13")
    ordinal = "th" 
  elsif century.end_with?("1")
    ordinal = "st"
  elsif century.end_with?("2")
    ordinal = "nd"
  elsif century.end_with?("3")
    ordinal = "rd"
  else
    ordinal = "th"
  end

  century + ordinal

end

p century(2000) # == '20th'
p century(2001) # == '21st'
p century(1965) # == '20th'
p century(256) # == '3rd'
p century(5) # == '1st'
p century(10103) # == '102nd'
p century(1052) # == '11th'
p century(1127) # == '12th'
p century(11201) # == '113th'
