# given a string
# set array = string characters split
# set integer = 0
# Loop backwards through array
  # Last element: Add 1 if first character is '1', etc
  # second last element: Add 10
  # etc
  DIGITS = {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '0' => 0
  }

def string_to_integer(string)
  iterator = 1
  integer = 0
  loop do
    integer += (DIGITS[string[-iterator]] * (10 ** (iterator - 1)))
    break if iterator == string.size
    iterator += 1
  end
  integer
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570
