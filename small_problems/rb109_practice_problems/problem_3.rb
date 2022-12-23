# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Algorithm: 
  # Split the input string into an array of words
  # Create a results array
  # Iterate through the string array
    # If the index of the sub array % 3 = 2
      # Create a new string whereby we have iterated through each character and mutated all second characters
      # Take a counter and set equal to 0
      # If counter is odd, call upcase method on the character
    # Else
      # Push sub array to results array

def to_weird_case(string)
  string_array = string.split
  result = []

  string_array.each do |sub_arr|
    if string_array.index(sub_arr) % 3 == 2
      mod_arr = sub_arr[0].chars.map do |char|
        if sub_arr[0].index(char).odd? 
          char.upcase
        else
          char
        end
      end
      result << mod_arr.join
    else
      result << sub_arr
    end
  end

  result
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') # == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') # == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') # == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') # == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".