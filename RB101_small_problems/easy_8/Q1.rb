# Write a method that takes an Array of numbers
# and then returns the sum of the sums of each leading subsequence for that Array.
# You may assume that the Array always contains at least one number.

# Given an array
# set sum = 0
# Loop through array indices:
  # add to sum and store as sum: elements up to and include current index

def sum_of_sums(array)
  sum = 0
  array.each_index { |idx| sum = array[..idx].reduce(sum, :+) }
  sum
end


sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
