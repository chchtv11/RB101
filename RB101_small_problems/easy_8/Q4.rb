# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position,
# the substrings at a given position should be returned in order from shortest to longest.
# You may (and should) use the leading_substrings method you wrote in the previous exercise

# Given a string
# Set substrings = []
# Loop from 0 to length of string -1:
  # Grab leading substrings from that position
  # Insert into `substrings`


def leading_substrings(string)
  substrings = []
  string_split = string.split('')
  string_split.each_index { |idx| substrings << string_split[..idx].join }
  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |index|
    substrings << leading_substrings(string[index..])
  end
  substrings.flatten
end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
