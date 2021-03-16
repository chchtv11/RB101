# Write a method that takes a string as an argument
# and returns a new string in which every uppercase letter is replaced by its lowercase version,
# and every lowercase letter by its uppercase version.
# All other characters should be unchanged.
#
# You may not use String#swapcase; write your own version of this method.


# Given a string
# set new_string = ''
# Loop through string characters:
  # if character is lowercase, uppercase it, add to new_string
  # if character is uppercase, downcase it, add to new_string

def swapcase(string)
  new_string = ''
  string.each_char do |char|
    if ('a'..'z').include?(char)
      new_string << char.upcase
    else
      new_string << char.downcase
    end
  end
  new_string
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
