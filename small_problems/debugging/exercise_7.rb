def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# The issue that we have here is that we are mutating an array as we are iterating through it, which we should never do. 
# The word 'dull' is at index 1 of the array. When we iterate over it in the each method here, we delete it. 
# This means that when we next iterate through 'each', the next word (which is boring) is now at index 1. However, the iterate continues at index 2 meaning boring is missed and is not deleted.
# Iteration works on a live version of the array, not stale meta dataa