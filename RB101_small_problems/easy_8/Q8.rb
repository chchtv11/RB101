# Write a method that takes a string, and returns a new string in which every consonant character is doubled.
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def is_consonant?(char)
  char.match?(/[bcdfghjklmnpqrstvwxyz]/i)
end

def double_consonants(string)
  new_string = ''
  string.each_char do |char|
    new_string << char
    new_string << char if is_consonant?(char)
  end
  new_string
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
