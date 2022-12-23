=begin
Reverse Only Letters

Given a string s, reverse the string according to the following rules:

All the characters that are not English letters remain in the same position.
All the English letters (lowercase or uppercase) should be reversed.

Return s after reversing it.

Input: String containing both letters and non-letters
Output: The string but with all English letters reversed and all non english letters in the same position. 

Algorithm: 
1. Set left index equal to - string length
2. Set right index equal to - 1
3. Split the input string into an array of chars. 
4. Until the left index is more than or equal to the right index: 
  a. If the left index is a letter and the right index is a letter: 
    swap the left index with the right index
    add one to the left index
    take one away from the right index
  b. elsif the left index is not a letter
    add one to the left index
  c. else
    take one away from the right index. 
5. Return the joined array. 
=end

def reverse_only_letters(string)
  left_idx = -string.length
  right_idx = -1
  characters = string.chars 
  
  until left_idx >= right_idx
    if characters[left_idx] =~ /[a-z]/i && characters[right_idx] =~ /[a-z]/i
      characters[left_idx], characters[right_idx] = characters[right_idx], characters[left_idx]
      left_idx += 1
      right_idx -= 1
    elsif !(characters[left_idx] =~ /[a-z]/i)
      left_idx += 1
    else 
      right_idx -=1
    end
  end

  characters.join
end


p reverse_only_letters("a-bC-dEf-ghIj") == "j-Ih-gfE-dCba"
p reverse_only_letters("ab-cd") == "dc-ba"
p reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"
