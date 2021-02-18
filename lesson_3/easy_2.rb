# Q1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.key?("Spot")
ages.member?("Spot")

# Q2
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.capitalize
# "The munsters are creepy in a good way."
munsters_description.downcase
# "the munsters are creepy in a good way."
munsters_description.upcase
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."


# Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# Q4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")

# Q5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)

# Q6
flintstones << 'Dino'
# or:
flintstones.push('Dino')

# Q7
flintstones.push('Dino', 'Hoppy')

# Q8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(/.*as /)

# Q9
statement = "The Flintstones Rock!"
statement.count('t')

# Q10
title = "Flintstone Family Members"
spaces = (40 - title.length) / 2
# title.center(40)
