# 1. Is there a better way to validate that the user has input a number?
# We'll cover this in more detail in a future assignment.

# - the main issue with using to_i() is that it will evaluate to 0 for strings without a number at the beginning
# - so, if someone enters 0 or "0", the validation will fail.
# - To avoid this, we could add a catch like so:

#   def valid_number?(number)
#     (number.to_i != 0) || [0, "0"].include?(number)

# 2.
# Suppose we're building a scientific calculator, and we now need to account for inputs that include decimals.
# How can we build a validating method, called number?, to verify that only valid numbers -- integers or floats -- are entered?

# def number?(input)
#   if input.include?(".")
#     input == input.to_f.to_s
#   else
#     input.to_i.to_s == input
#   end
# end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect
