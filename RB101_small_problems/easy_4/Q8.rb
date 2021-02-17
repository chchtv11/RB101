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

def string_to_signed_integer(string)
  first_digit = string[0]
  if ['-', '+'].include?(first_digit)
    integer = string_to_integer(string[1..])
    first_digit == '-' ? -integer : integer
  else
    string_to_integer(string)
  end
end

# BONUS - reduce # of calls to methods
def string_to_signed_integer(string)
  string_no_sign = ['-', '+'].include?(string[0]) ? string[1..-1] : string
  integer = string_to_integer(string_no_sign)
  string[0] == '-' ? -integer : integer
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
