DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  if number < 0
    '-' + integer_to_string(-number)
  else
    (number > 0 ? "+" : "") + integer_to_string(number)
  end
end

# BONUS
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then
    suffix = "-"
    number = -number
  when +1 then
    suffix = "+"
  else
    suffix = ""
  end

  "#{suffix}#{integer_to_string(number)}"
end


  signed_integer_to_string(4321) == '+4321'
  signed_integer_to_string(-123) == '-123'
  signed_integer_to_string(0) == '0'
