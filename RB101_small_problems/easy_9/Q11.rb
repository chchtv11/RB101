# Anagrams

# Given an array of words
# Set sorted_chars = array where characters in each word are sorted alphabetically
# Iterate through unique set of sorted_chars
  # If word appears more than once, return an array with all versions

def anagrams(list)
  list.map { |word| word.split('').sort.join }.uniq.each do |chars|
    print list.select { |word| word.split('').sort.join == chars }
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


["demo", "dome", "mode"]
["neon", "none"]
#(etc)
