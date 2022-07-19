=begin
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end
=end

def staggered_case(str, first_char_capital: false)
  str.chars.map do |char|
    transformed_char = first_char_capital ? char.upcase : char.downcase
    first_char_capital = !first_char_capital
    transformed_char
  end.join
end

p staggered_case('I Love Launch School!')                                 # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 NuMbErS'