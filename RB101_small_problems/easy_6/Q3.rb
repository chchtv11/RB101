# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition,
# and each subsequent number is the sum of the two previous numbers
# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

#Requirements:
  # Given a number representing a number of digits
  # Return the index of the first fibonacci number that has that many digits
  # Index starts at 1 (not 0)
  # the argument is always greater than or equal to 2.

# Algorithm:
  # Given a number `digits`
  # Create new array `numbers` where the first two elements are `1`
  # Set current_index = 1
  # Loop:
    # Add new element to array that equals the sum of the last 2 digits
    # Increase current_index by 1
    # Check if the new element has # of digits equal to `digits`
      # If it is, return the current_index

def find_fibonacci_index_by_length(digits)
  numbers = [1, 1]
  current_index = 2
  loop do
    current_index += 1

    current_value = numbers.last(2).sum
    break if current_value.to_s.size >= digits

    numbers << current_value

  end

  current_index
end


find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847


(0..(word.size - 1)).to_a.map do |idx|
  case idx
    when 1
      then word[word.size - 1]
    when (word.size - 1)
      then word[1]
    else
      word[idx]
  end
end.join('')