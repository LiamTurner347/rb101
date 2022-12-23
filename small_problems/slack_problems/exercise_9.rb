=begin
Remove Anagrams

You are given an array of words, where each words consists of lowercase English letters.

In one operation, select any two adjacent words (words[i - 1] and words[i]) that are anagrams of each other, and delete words[i] 
from words. Keep performing this operation as long as you can select an index that satisfies the conditions.

NOTE: a valid index is such that 0 < i < words.length

Return words after performing all operations. It can be shown that selecting the indices for each operation 
in any arbitrary order will lead to the same result.

An Anagram is a word or phrase formed by rearranging the letters of a different 
word or phrase using all the original letters exactly once. For example, "dacb" is an anagram of "abdc".

Example 1:
Input: words = ["abba","baba","bbaa","cd","cd"]
Output: ["abba","cd"]
Explanation:
One of the ways we can obtain the resultant array is by using the following operations:
- Since words[2] = "bbaa" and words[1] = "baba" are anagrams, we choose index 2 and delete words[2].
 Now words = ["abba","baba","cd","cd"].
- Since words[1] = "baba" and words[0] = "abba" are anagrams, we choose index 1 and delete words[1].
 Now words = ["abba","cd","cd"].
- Since words[2] = "cd" and words[1] = "cd" are anagrams, we choose index 2 and delete words[2].
 Now words = ["abba","cd"].
We can no longer perform any operations, so ["abba","cd"] is the final answer.

Example 2:
Input: words = ["a","b","c","d","e"]
Output: ["a","b","c","d","e"]
Explanation:
No two adjacent strings in words are anagrams of each other, so no operations are performed.

Input: An array of strings
Output: Another array of strings where the words whose previous word in the array is an anagram are deleted. 

Rules
  - Explicit:
    An anagram is a word of phrase containing all of the same letters (and the same number of those letters) as another word
    Where two words which are next to each other are anagrams, the second should be removed from the output array
  - Implicit: 
    The first item in the input array will always be in the output array. 

Algorithm: 
  - Set a counter equal to 1
  - Run a loop until counter > array.length
    - If the item at counter index of the array is an anagram of the item at counter - 1 index of the array. 
      - delete the item at counter from the input array
    - Else
      - counter += 1
  - might want a separate helper method to determine whether two items are anagrams of each other (is_anagram?(word 1, word 2))
    - query whether an array of the characters in word 1 sorted is the same as an array of characters in word 2 sorted. 
  - return the array
=end

def remove_anagrams(array)
  index = 1

  until index >= array.length do
    if (array[index]).chars.sort == (array[index - 1]).chars.sort
      array.delete_at(index)
    else
    index += 1
    end
  end

  array
end

p remove_anagrams(["bat", "tab", "all", "tea", "eat"]) == ["bat","all","tea"]
p remove_anagrams(['a','b','c','d','e']) == ['a','b','c','d','e']
p remove_anagrams(["dog", "god"]) == ["dog"]
p remove_anagrams(["abba","baba","bbaa","cd","cd"]) == ["abba","cd"]
p remove_anagrams(["day","tina", "anit","house","note", "tone"]) == ["day","tina","house","note"]


