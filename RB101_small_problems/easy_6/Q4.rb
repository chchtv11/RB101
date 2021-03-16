# Write a method that takes an Array as an argument,
# and reverses its elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.

# Given an array
# Reverse elements and return the same array

# input: array`
# output: same array

# Algorithm:
# Given an array
# set `start_index` = 0
# set `end_index` = (length of array) - 1
# Loop:
  # insert value of `current_value` into array elemnt at index start_index
  # Remove item at `end_index` and store value as `current_value` - 1
  # increase start_index by 1
  # decrease end_index by 1
  # break when (end_index - start_index) <= 1

def reverse!(list)
  start_index = 0
  end_index = list.size - 1

  loop do

    break if (end_index - start_index) <= 1

    start_value = list.delete_at(start_index)
    end_value = list.delete_at(end_index - 1)
    list.insert(start_index, end_value)
    list.insert(end_index, start_value)

    start_index += 1
    end_index -= 1
  end
  list
end

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
