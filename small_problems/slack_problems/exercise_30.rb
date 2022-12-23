=begin
Find Common Characters

Given a string array words, return an array of all characters that show up in all strings 
within the words (including duplicates). You may return the answer in any order.

Input: An array containing three strings
Output: An array containing all of the characters which are in all three strings in the input array (inc duplicates)

Algorithm: 
1. Create a results array.
2. Iterate through each character in the first string in the input array. 
  - Within that iteration, if the second string and the third string both include the character: 
    - Push the character to the results array. 
    - Find the index of the character in word 2
    - Delete the item at the relevant index of word 2
    - Find the index of the character in word 3
    - Delete the item at the relevant index of word 3. 
3. Return the results array. 
=end

def common_chars(array)
  results = []
  array.map!(&:chars)
  
  array[0].each do |char|
    if array[1].include?(char) && array[2].include?(char)
      results << char
      word2_index = array[1].index(char)
      array[1].delete_at(word2_index)
      word3_index = array[2].index(char)
      array[2].delete_at(word3_index)
   end
  end

  results
end

p common_chars(["bella","label","roller"]) == ["e","l","l"]
p common_chars(["cool","lock","cook"]) == ["c","o"]
p common_chars(["car", "racecar", "rat"]) == ["a","r"]
p common_chars(["abc", "def","hij"]) == []

