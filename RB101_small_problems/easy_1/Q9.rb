# Given an integer
# Convert to String. Split string characters into array items.
# Convert back to number and add together

def sum(int)
  array = int.to_s.split('')
  sum = 0
  array.each { |string| sum += string.to_i }
  return sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
