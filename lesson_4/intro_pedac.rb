# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: list of palindromes from string
# rules:
  # Explicit Requirements:
    # palindromes must be returned in a list
    # palindromes are case sensitive
  # Implicit Requirements:
    # palindromes can be any sequences of letters that are spelled the same forward and backwad
      #  even within a word
    # The same characters from the string can appear in more than one palindrome
    # Empty strings or strings with no palindromes should return blank lists
    
