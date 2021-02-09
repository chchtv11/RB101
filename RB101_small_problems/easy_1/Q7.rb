# - Given an integer
# SET iterator = 1
# SET string = ''
# loop:
  # if iterator is odd: add 1 to end of string
  # elsif iterator is even: add 0 to end of string
  # break if iterator == integer
  # iterator += 1

def stringy(int, starting_digit=1)
  iterator = 1
  string = ''
  loop do
    if starting_digit == 1
      digit = iterator % 2
    elsif starting_digit == 0
      digit = iterator.odd? ? 0 : 1
    end
    string = "#{string}#{digit}"
    break if iterator == int
    iterator += 1
  end
  return string
end

# puts stringy(0)
puts stringy(6, 1)# == '101010'
puts stringy(6, 0)
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
