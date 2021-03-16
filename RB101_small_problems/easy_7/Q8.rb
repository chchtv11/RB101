# Write a method that takes two Array arguments in which each Array contains a list of numbers,
# and returns a new Array that contains the product of each pair of numbers from the arguments
# that have the same index. You may assume that the arguments contain the same number of elements.

# Given two arrays, array_1 & array_2
# Set new_array = []
# Loop through index & value of elements in array_1:
  # multiply value by the value of element at index in array_2
  # Store in new_array
# return new_array

def multiply_list(array_1, array_2)
  product = []
  array_1.each_with_index { |value, idx| product << (value * array_2[idx]) }
  product
end

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |arr| arr.reduce(:*) }
end


puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
