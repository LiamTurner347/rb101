def leading_substrings(string)
  array = []

  1.upto(string.length) do |count|
    array << string.slice(0, count)
  end

  array
end

p leading_substrings('abc') # == ['a', 'ab', 'abc']
p leading_substrings('a') # == ['a']
p leading_substrings('xyzzy') # == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']