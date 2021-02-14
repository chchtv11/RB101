# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

PROMPT_NUMBER = %w(1st 2nd 3rd 4th 5th last)

def prompt_for_number(number)
  puts "Enter the #{number} number:"
end

numbers = []
last_number = 0

PROMPT_NUMBER.each do |round|
  prompt_for_number(round)
  if round != 'last'
    numbers << gets.chomp().to_i()
  else
    last_number = gets.chomp.to_i()
  end
end

if numbers.include?(last_number)
  puts "The number #{last_number.to_s()} appears in #{numbers.to_s()}."
else
  puts "The number #{last_number.to_s()} does not appear in #{numbers.to_s()}."
end
