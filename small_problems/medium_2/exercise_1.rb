# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. 
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
# You should also print the number of words in the longest sentence.

# Input = text file
# Output = The longest sentence in the file and an integer signifying the number of words in that sentence. 

# Algorithm: 
  # Read the text file into a variable 
  # Create a set of delimiters which are to be used to split the text into an array of sentences
  # Split the text into an array of sentences
  # Find the largest sentence

  text = File.read('sample_text.txt')
  sentences = text.split(/\.|\?|!/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  number_of_words = largest_sentence.split.size
  
  puts "#{largest_sentence}"
  puts "Containing #{number_of_words} words"
