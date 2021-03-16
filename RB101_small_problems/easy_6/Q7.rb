# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements,
# the middle element should be placed in the first half Array.

# Given an array
# set havled = []
# set `length` = length of array
# set first_array_length  to (length / 2).ceiling
# Take the first first_array_length number of elements from `array`
  # insert them into `halved` as a nested array
# Take the remaining elements and insert them into `halved` as well

def halvsies(array)
  halved = []
  first_array_length = (array.size / 2.0).ceil
  halved << array[0, first_array_length]
  halved << array[first_array_length..]
end




halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
