NUMBERS = %w(zero one two three four five six seven eight nine ten eleven
  twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(number_array)
  number_array.sort_by { |num| NUMBERS[num] }
end

array = (0..19).to_a

alphabetic_number_sort(array) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
