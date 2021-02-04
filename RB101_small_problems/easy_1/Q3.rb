# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.

# Pseudo Code:
  # Given a positive integer, number
  # SET number_str = string representation of number
  # SET iterator = 0
  # SET result = []
  # WHILE iterator < length of number_str
    # SET result item at iterator = number_str item at iterator
    #  SET iterator = iterator + 1
  # RETURN result
# require 'pry'

def digit_list(number)
  number_str = number.to_s
  iterator = 0
  result = []
  while iterator < number_str.size
    result[iterator] = number_str[iterator].to_i
    iterator += 1
  end
  result
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
