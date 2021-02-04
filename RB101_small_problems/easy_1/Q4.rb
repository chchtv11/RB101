# Pseudo code:
# Given an array
# set iterator = 0
# set item_storage = ''
# set output = {}
# sort the array
# Loop:
  # if iterator = 0 add array item at iterator to Hash
  # else if item matches item_storage, increase Hash value by 1
  # increase iterator by 1

def count_occurrences(array)
  output = {}
  for item in array
    if output.has_key?(item.to_sym)
      output[item.to_sym] += 1
    else
      output[item.to_sym] = 1
    end
  end

  for key, value in output
    puts "#{key} => #{value}"
  end
end

count_occurrences(vehicles)


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
