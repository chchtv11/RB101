# Given a year
# Set Century = year Divide by 100. Add 1 if remainder exists
# set suffix dependeing on last two letters
  # if century ends in  0 or 4-9, or is between 11-13 : th
  # if century ends in 1: st
  # if century ends in 2: nd
  # if century ends in 3: rd

def century(year)
  century_value = year / 100.0
  if century_value % 10 > 0
    century_value += 1
  end
  century_value = century_value.to_i
  century_value.to_s + century_suffix(century_value)
end

def century_suffix(century)
  last_digit = century.to_s[-1].to_i
  last_two_digits = century.to_s.split('').last(2).join.to_i
  if ([0, *4..9].include?(last_digit)) || ([11, 12, 13].include?(last_two_digits))
    suffix = 'th'
  elsif last_digit == 1
    suffix = 'st'
  elsif last_digit == 2
    suffix = 'nd'
  elsif last_digit == 3
    suffix = 'rd'
  end
  suffix
end


puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
