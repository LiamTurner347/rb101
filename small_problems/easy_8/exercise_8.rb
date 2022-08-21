CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z B C D F G H J K L M N P Q R S T V W X Y Z)

def double_consonants(string)
  result = ""
  string.each_char do |char|
    CONSONANTS.include?(char) ? result << char << char : result << char
  end
  result
end

p double_consonants('String') # == "SSttrrinngg"
p double_consonants("Hello-World!") # == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") # == "JJullyy 4tthh"
p double_consonants('') # == ""

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end