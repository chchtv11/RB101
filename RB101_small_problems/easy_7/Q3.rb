# Write a method that takes a single String argument
# and returns a new string that contains the original value of the argument
# with the first character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.


# Given a string
# Split string by spaces
# Loop through words in split string:
  # capitalize first letter, downcase the rest

def word_cap(string)
  string.split.each { |word| word.capitalize! }.join(' ')
end


puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
