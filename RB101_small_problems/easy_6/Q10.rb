# Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle, and the other end at the upper-right.

# Given a positive integer, `n`
# Loop n times, where `row` is the number of the current iteration:
  # print a string where the number of characters equals n
  # The first n-row characters are strings, the last character is a *

def triangle(n)
  (n+1).times { |row| puts "#{' ' * (n-row)}#{'*' * row}" }
end

triangle(5)
triangle(9)

#     *
#    **
#   ***
#  ****
# *****
