# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case;
# that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
# In addition, assume that single characters are not palindromes.


# Given a string
# Set palindromes = []
# Set `substrings` = array of all substrings in `string`
# Loop through `substrings`:
  # Check if substring is a palindrome using `is_palindrome?`
  # Store in `palindromes`

## Method is_palindrome?
  # Given a string
  # Return true if:
    # string == reverse of string
    # length of string is greater than 1

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

def is_palindrome?(string)
  (string == string.reverse) && (string.length > 1)
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select { |sub| is_palindrome?(sub) }
end


palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
