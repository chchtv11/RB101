# Given a string
# Split the string into an array, separated by space
# Set iterator = length of array
# Set reverse_string = ''
# Iterate through backwards and add to reverse_string

def reverse_sentence(string)
  array = string.split()
  iterator = array.length
  reverse_string = ''
  loop do
    break if iterator == 0
    iterator -= 1
    if reverse_string == ''
      reverse_string = array[iterator]
    else
      reverse_string = "#{reverse_string} #{array[iterator]}"
    end
  end
  reverse_string
end


puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
