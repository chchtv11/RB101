# Given a string
# SET array = Words from string split into array items
# SET reversed =[]
# Iterate over array:
  # if word is >5 characters: Reverse it.
  # Store word in reversed
# Join array together with spaces between words

def reverse_words(string)
  split_array = string.split
  reversed_array = []
  split_array.each do |word|
    if word.length > 5
      word.reverse!
    end
    reversed_array << word
  end
  return reversed_array.join(" ")
end

puts reverse_words('Professional') == 'lanoisseforP'
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
