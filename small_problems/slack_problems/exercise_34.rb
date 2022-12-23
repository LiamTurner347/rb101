=begin
Goat Latin

You are given a string sentence that consist of words separated by spaces. Each word consists of lowercase and uppercase letters only.

We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.) The rules of Goat Latin are as follows:

   If a word begins with a vowel ('a', 'e', 'i', 'o', or 'u'), append "ma" to the end of the word.
       For example, the word "apple" becomes "applema".
   If a word begins with a consonant (i.e., not a vowel), remove the first letter and append it to the end, then add "ma".
       For example, the word "goat" becomes "oatgma".
   Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
       For example, the first word gets "a" added to the end, the second word gets "aa" added to the end, and so on.

Return the final sentence representing the conversion from sentence to Goat Latin.

Input: A string
Output: A string but converted into goat latin

Rules:
  - If word beginds with a vowel, append "ma" to the end of the word
  - Else
    append first letter of the word to the end of the word
    add "ma" to the end of the word
    delete the first letter of the word
  - Add index + 1 "a"s to the end of each word
  - Return the amended string 

Algorithm: 
  - Create an array containing all of the vowels
  - Split the input string into an array of words. 
  - Iterate through each word. 
    - If the first character in the word is a vowel
      Push "ma" to the end of the word
    - Else
      Destructively slice the first character and Push it to the end of the word
      Push "ma" to the end of the word
  - Again iterate through each word (but this time with index)
      Push "a" * (index + 1) to the end of the word. 
  - Return the joined string with spaces.
=end

def to_goat_latin(string)
  vowels = %w(a e i o u)
  words = string.split 

  words.each_with_index do |word, idx|
    if vowels.include?(word[0])
      word << "ma"
    else
      word << word.slice!(0)
      word << "ma"
    end

    word << ("a" * (idx + 1))
  end

  words.join(" ")
end

p to_goat_latin("The quick brown fox jumped over the lazy dog") == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
p to_goat_latin("I speak Goat Latin") == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
