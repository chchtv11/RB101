# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

# Given a string that contains at least 2 words
# Split string into array by spaces
# Set len = length of array
# Return word at position (len-2)

def penultimate(string)
  words = string.split
  words[(words.size - 2)]
end



puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
