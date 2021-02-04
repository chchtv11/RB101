
a = %w(a b c d e)

# puts a.fetch(7)
# Index error

puts a.fetch(7, 'beats me')
# beats me
# This is the default argument

puts a.fetch(7) { |index| index**2 }
# 49
# block will be evaluated when index is out of bounds
