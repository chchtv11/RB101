def neutralize(sentence)
  words = sentence.split(' ')
  censored = words.select do |word|
    !negative?(word)
  end

  censored.join(' ')
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