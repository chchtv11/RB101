# Given an array
# set running_total = []
# Loop through items, set valyue of running_total item as sum up to and including current item

def running_total(array)
  running_total = []
  array.each_index { |idx| running_total[idx] = array[..idx].reduce(:+) }
  running_total
end

def running_total(array)
  array.map.each_with_index { |_, idx| array[..idx].reduce(:+) }
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
