name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# they will both be BOB because upcase! modifies the caller
# In the previous example, name was being reassigned to a new address in memory
# Here, the value stored in that address is being mutated
