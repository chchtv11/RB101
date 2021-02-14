puts ">> Please enter an integer greater than 0:"
range_end = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

range = (1..range_end)

if operation == 's'
  # result = 0
  # range.each {|num| result += num}
  result = range.inject {|sum, num| sum + num}
  puts "The sum of the integers between 1 and #{range_end} is #{result}."
elsif operation == 'p'
  # result = 1
  # range.each {|num| result = result * num}
  range.inject {|product, num| product * num}
  puts "The product of the integers between 1 and #{range_end} is #{result}."
else
  puts "Invalid operator!"
end




# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
