# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, 
# and whose digits occur exactly once each. 

# So, for example, 49 is a featured number, but 98 is not (it is not odd), 
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, 
# and returns the next featured number that is greater than the argument. 
# Return an error message if there is no next featured number.


# Given an integer
# Set featured_numbers = range of numbers that meet the criteria
# Search for the first featured number greater than the given integer

def featured_conditions_met?(number)
  number.odd? &
  (number % 7 == 0) &
  (number.to_s.chars.uniq.length == number.to_s.chars.length)
end

def featured(number)
  (number + 1).upto(1_023_456_987) do |n|
    return n if featured_conditions_met?(n)
  end
  return "There is no possible number that fulfills those requirements"
end





featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

