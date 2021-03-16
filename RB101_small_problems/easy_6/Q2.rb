# Write a method that takes an array of strings
# and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# input: array
# output: new array
# requirements:
  # Explicit:
    # vowels are removed from each array item
  # implicit:
    # case insensitive
    # If string is all vowels, item will be a blank string

# Algorithm:
  # Given an array
  # Create new array `no_vowels`
  # Iterate through array elements. For each word:
    # delete vowels
    # append to new array


VOWELS = 'aeiouAEIOU'

def remove_vowels(strings)
  strings.map { |word| word.delete(VOWELS) }
end



remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
