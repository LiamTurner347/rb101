def short_long_short(string_a, string_b)
  if string_a.length > string_b.length
    string_b + string_a + string_b
  else
    string_a + string_b + string_a
  end
end

p short_long_short('abc', 'defgh') # == "abcdefghabc"
p short_long_short('abcde', 'fgh') # == "fghabcdefgh"
p short_long_short('', 'xyz') # == "xyz"