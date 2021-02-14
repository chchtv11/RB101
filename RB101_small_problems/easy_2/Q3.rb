puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_perc = gets.chomp.to_f

tip_amount = (bill * (tip_perc / 100)).round(2)

puts "The tip is $#{format('%.2f', tip_amount)}"
puts "The total is $#{format('%.2f', tip_amount + bill)}"
