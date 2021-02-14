# given a string
# if string = string.reverse then return true

def palindrome?(word)
  word == word.reverse
end

# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true


# BONUS
# 1. array

def palindorme_array?(arr)
  arr == arr.reverse
end

# puts palindorme_array?(['hello', 'goodbye', 'hello'])

# 2. either array or string

def palindrome_obj?(obj)
  obj == obj.reverse
end

puts palindrome_obj?(['hello', 'goodbye', 'hello'])
puts palindrome_obj?('madam')
