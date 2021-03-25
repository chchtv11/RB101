# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the words
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.


def word_to_digit(string)
  numbers = %w(zero one two three four five six seven eight nine)

  numbers.each_with_index { |word, number| string.gsub!(/#{word}/, number.to_s) }
  string
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
