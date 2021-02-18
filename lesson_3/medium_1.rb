# Q1
10.times { |line| puts(" " * line + "The Flintstones Rock!") }

# Q2
puts "the value of 40 + 2 is " + (40 + 2)
# this will error because (40 + 2) is an int, you can't concatenate it to a String
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Q3
def factors(number)
  factors = []
  (1..number).each do |divisor|
    factors << number / divisor if number % divisor == 0
  end
  factors
end
# number % divisor == 0 tests that number is evenly divisible by divisor, no remainder
# line 8 is to return factors, since the loop does not return it

# Q4
# rolling_buffer2 will create an array with nested arrays
# /WRONG. it is not nested

# Q5
# he has to pass `limit` in as an argument

#Q6
 # 34

# Q7
# No, the original hash was not changed
# Because the change to family_members wasn't assigned to the hash elements
#  WRONG. it will be changed. You're reassigning values to the age & gender keys in the nested hash

# Q8
# paper

# Q9
# no
