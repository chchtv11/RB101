# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# Given a string
# Set counts = hash with lowercase, uppercase, neither keys set to 0
# Loop through each character:
  # If character is lowercase, increase lowercase by 1, etc

def letter_case_count(string)
  counts = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  string.each_char do |char|
    if ('a'..'z').include?(char)
      counts[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
  end


puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
