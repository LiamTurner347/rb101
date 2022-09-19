def uppercase?(string)
  string.chars.any? { |char| char =~ /[a-z]/ } ? false : true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

def uppercase?(string)
  string == string.upcase
end