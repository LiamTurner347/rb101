def palindrome?(argument)
  argument == argument.reverse
end

p palindrome?('madam') # == true
p palindrome?('Madam') # == false          # (case matters)
p palindrome?("madam i'm adam") # == false # (all characters matter)
p palindrome?('356653') # == true
p palindrome?(["foo", "bar", "two", "two", "bar", "foo"]) # == true
p palindrome?(["Foo", "bar", "two", "Two", "bar", "foo"]) # == false
p palindrome?([1, 2, 3, 3, 2, 1]) # == true