# Given an array, return the same array with elements reversed

# Given an array
# Set reversed = []
# loop through array
  # assign first index of `reversed` to the value of the current element


def reverse(list)
  reversed = []
  list.each { |value| reversed.prepend(value) }
  reversed
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
