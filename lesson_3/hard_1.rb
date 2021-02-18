### Q1
# "hello world"

### Q2
# { a: 'hi there' }

### Q3
## A
# "one is: one"
# "two is: two"
# "three is: three"

## B
# Same as A

# C
# "one is: two"
# "two is: three"
# "three is: one"

# D
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless %w(1 2 3 4 5).include?(word) #is_an_ip_number?(word)
  end
  return true
end
