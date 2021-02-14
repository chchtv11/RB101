# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# SET range = all numbers from 1 to 99
# LOOP through range:
  # if number is odd, print it


# (1..99).each {|num| puts num if num.odd?}

number = 1
loop do
  puts number if number.odd?
  number += 1
  break if number > 99
end
