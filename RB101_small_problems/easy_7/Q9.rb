# Write a method that takes two Array arguments in which each Array contains a list of numbers,
# and returns a new Array that contains the product of every pair of numbers
# that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.


# Given two non-empty arrays, array_1 & array_2
# Combine each element of array_1 with array_2 into nested arrays
# Get the product of each nested array
# sort

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |pair| pair.reduce(:*) }.sort
end



multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
