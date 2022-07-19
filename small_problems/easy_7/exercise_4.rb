def swapcase(string)
  swap_str = string.chars.map do |char|
    if char =~ /[a-z]/ 
      char.upcase
    elsif char =~ /[A-Z]/ 
      char.downcase
    else 
      char
    end
  end
  swap_str.join
end

p swapcase('Tonight on XYZ-TV')           # == 'tONIGHT ON xyz-tv'

p swapcase('CamelCase') # == 'cAMELcASE'