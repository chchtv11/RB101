puts "Enter the length of the room in meters:"
length = gets.chomp().to_f()

puts "Enter the width of the room in meters:"
width = gets.chomp().to_f()

area_m = length * width
area_f = area_m * 10.7639

puts "The area of the room is #{area_m} square meters (#{format('%.2f', area_f)} square feet)"
