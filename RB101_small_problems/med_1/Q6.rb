# Operations (all integer operations)

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# Programs will be supplied to your language method via a string passed in as an argument.
# Your program may assume that all programs are correct programs;
# that is, they won't do anything like try to pop a non-existent value from the stack,
# and they won't contain unknown tokens.

# You should initialize the register to 0.

# Given a string command of different operations
# Set register = 0
# Set stack = []
# Set `operations` = Split the string by spaces
# Iterate through `operations`:
  # Perform operation on register and /or stack

def perform_command(command, register, stack)
  return command.to_i, stack if command.to_i.to_s == command

  case command
  when 'PUSH'
    stack.push(register)
  when 'ADD'
    register += stack.pop
  when 'SUB'
    register -= stack.pop
  when 'MULT'
    register *= stack.pop
  when 'DIV'
    register = register / stack.pop
  when 'MOD'
    register = register % stack.pop
  when 'POP'
    register = stack.pop
  when 'PRINT'
    puts register
  end
  return register, stack
end


def minilang(command_string)
  commands = command_string.split
  register = 0
  stack = []

  commands.each { |command| register, stack = perform_command(command, register, stack) }
end



minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15
#
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
