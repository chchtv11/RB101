# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# def select_fruit(produce_hash)
#   fruit = {}
#   produce_hash.each do |key, value|
#     if value == 'Fruit'
#       fruit[key] = value
#     end
#   end
#   fruit
# end
#
# puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
#


# Double Numbers
# def double_numbers!(numbers)
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     numbers[counter] *= 2
#
#     counter += 1
#   end
#
#   numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_numbers!(my_numbers).inspect # => [2, 8, 6, 14, 4, 12]
# puts my_numbers.inspect


# Double numbers with odd indices
# def double_odd_indices(numbers)
#   doubled_numbers = []
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number
#
#     counter += 1
#   end
#
#   doubled_numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# puts double_odd_indices(my_numbers).inspect  # => [2, 4, 6, 14, 2, 6]
#
# # not mutated
# puts my_numbers.inspect                      # => [1, 4, 3, 7, 2, 6]



# MULTIPLY
def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers[counter] = numbers[counter] * factor

    counter += 1
  end
  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3).inspect # => [3, 12, 9, 21, 6, 18]
