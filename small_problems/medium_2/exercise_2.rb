# A collection of spelling blocks has two letters per block, as shown in this list:
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. 
# Each block can only be used once.
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Input: A word, which could be lowercase or uppercase
# Output: A boolean, true or false

# Algorithm: 
# Create some kind of data structure that includes all of these blocks i.e. could be a nested array or a hash
# Iterate through each letter in the input string (uppercased)
# If the input string matches either the key or the value in the hash, delete the key value pair associated with the key from the hash
# If the input string does not match either the key or the value in the hash, return false
# End loop
# Otherwise, return true

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
=end
