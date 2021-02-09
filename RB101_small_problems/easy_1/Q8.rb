# Given a non-empty array containing positive integers
# SET sum = 0
# loop through array
  # sum + item
# average = sum / length of array

def average(numbers)
  sum = 0
  numbers.each { |num| sum += num}
  return sum / (numbers.size*1.0)
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8])# == 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
