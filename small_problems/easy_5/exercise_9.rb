def crunch(string)
  new_array = []
  string.chars.each do |word|
    new_array << word unless new_array.last == word
  end
  new_array.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg')  == 'g'
p crunch('a') == 'a'
p crunch('') == ''