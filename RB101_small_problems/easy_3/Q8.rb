# given an array
# set return_array = []
# loop through array elements
  #  if index is odd, add to return_array

def oddities(array)
  return_array = []
  array.each_with_index { |value, idx| return_array << value if (idx + 1).odd? }
  return_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
