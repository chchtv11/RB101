age = ''
loop do
  age = rand(200)
  puts age
  break if age >= 20
end
puts "Teddy is #{age} years old"
