# Write a method that takes an Array of integers as input, multiplies all the numbers together,
 # divides the result by the number of entries in the Array,
 # and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

# given an array of integers
# set product = 1
# Loop through elements in array:
  # multiply product by current element
# Divide product by number of elements in array, round to 3 decimal places

def show_multiplicative_average(array)
  product = 1
  array.each { |num| product *= num }
  puts format('%.3f', product / array.size.to_f)
end


show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
