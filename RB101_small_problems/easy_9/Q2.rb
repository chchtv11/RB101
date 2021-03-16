# A double number is a number with an even number of digits whose left-side digits
# are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

# Given a number
#  if number is a double number
  # return number * 2
  # else return number

## Check for double number:
  # Convert number to string
  # Check that length of number is odd
  # Divide number into two strings of equal length and compare

def double_number?(number)
  string_num = number.to_s
  len = string_num.length
  return string_num[..(len / 2)-1] == string_num[(len / 2)..] if len.even?
  false
end

def twice(number)
  if double_number?(number)
    number
  else
    number * 2
  end
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
