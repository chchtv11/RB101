puts "What is your age?"
current_age = gets.chomp().to_i()

puts "At what age would you like to retire?"
retire_age = gets.chomp().to_i()

current_year = Time.now.year
retire_number_years = retire_age - current_age
retire_year = current_year + retire_number_years

puts "It's #{current_year}. You will retire in #{retire_year}.
You have only #{retire_number_years} years of work to go!"
