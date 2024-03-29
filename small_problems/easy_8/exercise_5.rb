def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

def palindromes(string)
  substrings(string).select do |word|
    word == word.reverse && word.length > 1
  end
end

p palindromes('abcd') # == []
p palindromes('madam') # == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') # == [
  # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  # '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') # == [
  # 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]