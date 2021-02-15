# searches for all multiples of 3 or 5 that lie between 1 and some other number
# and then computes the sum of those multiples.
# For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# Given an integer and end_range
# Set result = 0
# Iterate through numbers between 1 and end_range
  # If number is divisibly by 3 or 5, add to result


# def multisum(end_range)
#   result = 0
#   end_range.times do |idx|
#     num = idx + 1
#     result += num if (num % 3 == 0) ||  (num % 5 == 0)
#   end
#   result
# end

# BONUS -  use Enumerable.inject
def multiple?(number, multiple)
  number % multiple == 0
end

def multisum(end_range)
  sum = 0
  (1..end_range).inject do |sum, n|
    # puts n
    # puts sum
    # puts multiple?(n, 3)
    # puts multiple?(n, 5)
    if multiple?(n, 3) || multiple?(n, 5)
      sum + n
    else
      sum
    end
  end
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
