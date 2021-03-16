# Write a method that returns a list of all substrings of a string
# that start at the beginning of the original string.
# The return value should be arranged in order from shortest to longest substring.

# Given a string
# Set substring = []
# Split into an array where each element is a character
# Loop through array indices:
  # Retrieve substring up to and including current index
  # Insert it as an element in `substring`

def leading_substrings(string)
  substrings = []
  string_split = string.split('')
  string_split.each_index { |idx| substrings << string_split[..idx].join }
  substrings
end


puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
