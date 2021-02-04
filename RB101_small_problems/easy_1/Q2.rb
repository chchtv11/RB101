# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

# Examples:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Pseudo Code
  # Given an integer, num
  # Take absolute value of num:
    # If num > 0, set absolute_value = num
    # If num < 0 set absolute_value = -num
  # Return False if absolute value divided by 2 is greater than 0. Otherwise, return True.

def is_odd?(num)
  (num % 2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Re-write using Integer#remainder

def is_odd?(number)
  number.remainder(2) != 0
end
