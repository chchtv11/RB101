def multiply(number_1, number_2)
  number_1 * number_2
end

def square(number)
  multiply(number, number)
end


# puts square(5) == 25
# puts square(-8) == 64

# BONUS
def exponent(number, power)
  return number if power == 1
  return_value = number
  (power - 1).times { return_value = multiply(return_value, number) }
  return_value
end

puts exponent(4, 5)
puts exponent(4, 1)
