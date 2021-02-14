# given 2 boolean values
# if bool_1 is true
  # return true if bool_2 is false
# if bool_2 is true
  # return true is bool_1 is false


def xor?(bool_1, bool_2)
  result = false
  if bool_1 == true
    result = true if bool_2 == false
  elsif bool_2 == true
    result = true if bool_1 == false
  end
  result
end


puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
