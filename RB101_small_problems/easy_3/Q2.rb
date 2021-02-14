# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def prompt(message)
  puts "=> #{message}"
end

prompt('Enter the first number:')
number_1 = gets.chomp.to_f

prompt('Enter the second number:')
number_2 = gets.chomp.to_f

prompt("#{number_1} + #{number_2} = #{number_1 + number_2}")
prompt("#{number_1} - #{number_2} = #{number_1 - number_2}")
prompt("#{number_1} * #{number_2} = #{number_1 * number_2}")
prompt("#{number_1} / #{number_2} = #{number_1 / number_2}")
prompt("#{number_1} % #{number_2} = #{number_1 % number_2}")
prompt("#{number_1} ** #{number_2} = #{number_1 ** number_2}")
