# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
#
# You may assume that both input Arrays are non-empty,
# and that they have the same number of elements.

# Given 2 arrays of the same length
# create new blank array, `combined`
# loop through index of first array
# add element to `conbined` from element in current index position of first array
# add element to `conbined` from element in current index position of second array

def interleave(array_1, array_2)
  combined = []
  array_1.each_index do |idx|
    combined << array_1[idx]
    combined << array_2[idx]
  end
combined
end

def interleave(array_1, array_2)
  array_1.zip(array_2).flatten
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
