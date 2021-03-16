# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
 # Keep the first 2 digits fixed in place and rotate again to 321759.
 # Keep the first 3 digits fixed in place and rotate again to get 321597.
 # Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
 # The resulting number is called the maximum rotation of the original number.


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, digits)
  num_arr = number.to_s.split('')
  (num_arr[..-(digits + 1)] + rotate_array(num_arr[-digits..])).join.to_i
end

def max_rotation(number)
  num_digits = number.to_s.length
  (num_digits - 1).times do |round|
    right_digits = num_digits - round
    number = rotate_rightmost_digits(number, right_digits)
  end
  number
end


max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
