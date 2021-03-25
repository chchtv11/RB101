# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# Given an odd integer, n
# Loop n times:
  # number of starts:
    # number_of_stars = 1 on the first round
    # Add 2 for every subsequent round, until n is reached
    # Then, decrease by 2 every round
  # Number of left padding spaces = (n - number of stars) / 2

# center is (n+1)/2

def number_of_stars_on_line(line)


def diamond(n)
  number_of_stars = 0
  1.upto(n) do |line|
    # puts "line: #{line}"

      if line == 1
        number_of_stars = 1
      elsif line > (n + 1) / 2
        number_of_stars -= 2
      else
        number_of_stars += 2
      end
      # puts "number_of_stars: #{number_of_stars}"

      number_of_spaces = (n - number_of_stars) / 2

      puts "#{' ' * number_of_spaces}#{'*' * number_of_stars}"
  end
end
