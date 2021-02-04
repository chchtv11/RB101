def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Answer:
# will print an error when my_method is called
# because no default was provided for the argument d
# I believe the method will not error when created because arguments with defaults are grouped together (b & c)
