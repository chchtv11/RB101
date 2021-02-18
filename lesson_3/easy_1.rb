# Q1
[1, 2, 2, 3]

# Q2
# ! usually indicates an inversion of a boolean value, or a method that mutates the caller
# ? is usually used for testing a condition - TERNARY OPERATOR
# 1. != means "does not equal". Use for if/else conditions, or to return a boolen value
# 2. words.uniq! is a signal that the method mutates the caller, but this is just a common practice
# 3. ? before something -- NO CLUE
# 4. ? after something - Can be a logic test with values if true or false
# 5. !!user_name - forces a boolean OR is a double-inversion

# Q3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!(/important/, 'urgent')

# Q4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # This will delete the element at index 1 (value of 2)
numbers.delete(1) #This will delete the element with the value 2

# Q5
# Programmatically determine if 42 lies between 10 and 100.
(10..100).include?(42)

# Q6
famous_words = "seven years ago..."
famous_words = "Four score and #{famous_words}"
famous_words = "Four score and " + famous_words

# Q7
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!

# Q8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.assoc("Barney")
