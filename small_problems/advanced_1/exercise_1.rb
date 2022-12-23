=begin
Let's build another program using madlibs. We made a program like this in the easy exercises. 
This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, 
and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 
You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, 
but the text data should come from a file or other external source. 
Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

Example output:
The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

Example text data:
The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

Example replacement words:
adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverb: easily lazily noisily excitedly
=end

# Input: Some text from a text file
# Output: The text but with the adjectives, nouns, adverbs and verbs replaced by random words

# Data type: 
  # Input is going to be a string contained in a separate text file
  # In order to substitute in the adjectives, nouns, adverbs and verbs it probably makes sense to create a hash dictionary saved into a constant
    # which can then be accessed inside out method. 
      # The keys will be adjectives, nouns, adverbs and verbs
      # The values will be an array of adjectives, nouns, adverbs and verbs from which we can take a random selection when required. 

# Algorithm: 
  # Create text file containing the text data - use the words 'adjective', 'noun', 'adverb' and 'verb' as placeholders.
  # Create a CONSTANT dictionary hash containing the keys and values for substitution:
    # Keys = strings ('adjective', 'noun', 'adverb' and 'verb')
    # Values = array of strings containing adjectives etc as required. 
  # Read the text file into the program and save into a variable. 
  # Pass the variable as a string argument into the method
  # Iterate through each of the key value pairs in the hash dictionary and 
    # Perform gsub on the string passed into method and save it into a 'random string' variable
  # Return the random string

madlibs_data = File.readlines("madlibs.txt").map(&:chomp)

SUBWORDS = {
  "adjective" => ["quick", "lazy", "sleepy", "ugly"],
  "noun" => ["fox", "dog", "head", "leg"],
  "verbs" => ["jumps", "lifts", "bites", "licks"],
  "adverb" => ["easily", "lazily", "noisily", "excitedly"]
}

p madlibs_data

def madlibs(string)
  random_string = string.join(" ")
  SUBWORDS.each do |k, v|
    random_string.gsub!(k, v.sample)
  end
  random_string
end

p madlibs(madlibs_data)


# SOLUTION PROVIDED:

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end