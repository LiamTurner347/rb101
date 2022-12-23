=begin
Count Prefixes 
You are given a string array words and a string s, where words[i] and s comprise only 
of lowercase English letters.

Return the number of strings in words that are a prefix of s.

A prefix of a string is a substring that occurs at the beginning of the string. 
A substring is a contiguous sequence of characters within a string.

Note that the same string can occur multiple times in words, and it should be 
counted each time.

Input: An array of strings and a word string
Output: A number confirming how many of the words in the array are prefixes of the string. 

Algorithm: 
1. Select the strings in the array that are prefixes of the input string
  a. Iterate through each item in the array and select it if:
    The first n letters of the input string match the word (where n = word length)
2. Count the number of items in the prefix array.
=end

def count_prefixes(array, string)
  array.select do |chars|
    chars == string[0, (chars.length)]
  end.count
end

p count_prefixes(["f", "fl", "flow", "f", "a"], "flower") == 4
p count_prefixes(["a","b","c","ab","bc","abc"], "abc") == 3
p count_prefixes(["a","a"], "aa") == 2
p count_prefixes(["a","b","ab","abs","abs"],"absolutely") == 4
p count_prefixes(["c","d","e"],"abc") == 0

