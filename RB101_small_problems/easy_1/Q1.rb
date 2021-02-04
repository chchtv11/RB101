# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# 1. Process
  # input: a string & a positive integer
  # output: string, printed n number of times, where n is the integer input
# 2. Examples:
  # Input: repeat('Hello', 3)
  # Output:
    # Hello
    # Hello
    # Hello
# 3. Data Structure:
  # input: string & integer
  # output: strings
# 4. Algorithm:
  # Pseudo Code:
    # Given input_string and n
    # Loop n times:
      # Print input_string
  # Formal:
    # Given a string input_string and a positive integer n
    # START
    # SET iterator = 0
    # WHILE iterator < n
      # PRINT input_string
      # SET iterator = iterator + 1
    # END

def repeat(input_string, n)
  iterator = 0
  while iterator < n
    puts(input_string)
    iterator += 1
  end
end

repeat('Hello', 3)
