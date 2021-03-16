# Q1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstone_positions = {}

flintstones.each_index do |idx|
  current_value = flintstones[idx]
  flintstone_positions[current_value] = idx
end


#Q2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0
ages.each { |_, age| total_age += age }


# Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |_, age| age > 100 }
ages

# Q4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

# Q5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name.start_with?('Be') }

# Q6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map { |name| name[..2] }


# Q7
statement = "The Flintstones Rock"
frequency = {}
frequency.default = 0

statement.each_char { |char| frequency[char] += 1 if char != ' ' }


# Q8
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# 1
# 2

# Q9
words = "the flintstones rock"

def titleize(words)
  title = []
  words.split.each { |word| title << word.capitalize }
  title.join(' ')
end

titleize(words)



# Q10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  value['age_group'] =
    case value['age']
    when (0..17)
      then 'kid'
    when (18..64)
      then 'adult'
    else
      'senior'
    end
end

# value['age_group'] = case age
#   if (0..17).cover?(age)
#     'kid'
#   elsif (18..64).cover?(age)
#     'adult'
#   else
#     'senior'
#   end
