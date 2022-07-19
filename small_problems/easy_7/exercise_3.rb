def word_cap(string)
  new_string = string.split.map do |word|
    word.capitalize
  end
  new_string.join(" ")
end

p word_cap('four score and seven') # == 'Four Score And Seven'
p word_cap('the javaScript language') # == 'The Javascript Language'
p word_cap('this is a "quoted" word') # == 'This Is A "quoted" Word'