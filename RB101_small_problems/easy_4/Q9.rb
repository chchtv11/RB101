DIGITS = {
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  0 => '0'
}

# number = 678
first_digit = number % 10
# 8
number = (number - first_digit) / 10
# 670
store_value = number % 100
# 70
second_digit = store_value / 10
# 7
number -= second_digit
# 600

def integer_to_string(number)
  string = ''
  loop do
    digit = number % 10
    string = DIGITS[digit] + string
    number = (number - digit) / 10
    break if number == 0
  end
  string
end



integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

# BONUS - Methods that modify the caller
# String:
  # <<
  # clear
  # concat
  # replace
  # insert
  # prepend
# Array:
  # <<
  # clear
  # concat
  # fill
  # insert
  # keep_if
  # pop
  # push
  # append
  # replace
  # shift
# Hash:
  # delete
  # delete_if
  # replace
  # keep_if
  # shift
  # store
  # update
