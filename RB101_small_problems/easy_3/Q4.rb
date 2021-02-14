
puts("Please write word or multiple words:")
input = gets.chomp

n_char = input.split("").select { |char| char != " " }.size

puts "There are #{n_char} characters in \"#{input}\"."
