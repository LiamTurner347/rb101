def substrings(string)
  result = []

  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |index|
      result << string[start_index..index]
    end
  end

  result
end

p substrings('abcde') # == [
  # 'a', 'ab', 'abc', 'abcd', 'abcde',
  # 'b', 'bc', 'bcd', 'bcde',
  # 'c', 'cd', 'cde',
  # 'd', 'de',
  # 'e'
# ]

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end