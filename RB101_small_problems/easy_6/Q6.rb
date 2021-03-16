
# Write a method that takes two Arrays as arguments,
# and returns an Array that contains all of the values from the argument Arrays.
# There should be no duplication of values in the returned Array,
# even if there are duplicates in the original Arrays.

# Given 2 arrays: array_1 and array_2
# set merged = []
# Flatten array_1 and array_2 so they are one array
# Loop through array elements
  # if element does not exist in `merged`, append to `merged`

def merge(array_1, array_2)
  [array_1, array_2].flatten.uniq
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
