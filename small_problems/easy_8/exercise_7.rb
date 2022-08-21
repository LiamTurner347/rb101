def repeater(string)
  double_arr = []
  string.chars.each do |char|
    2.times { double_arr << char }
  end
  double_arr.join
end

p repeater('Hello') # == "HHeelllloo"
p repeater("Good job!") # == "GGoooodd  jjoobb!!"
p repeater('') # == ''

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end