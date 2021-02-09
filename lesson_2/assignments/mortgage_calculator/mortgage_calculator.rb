# frozen_string_literal: true

# Given: loan_amount, annual_rate, loan_duration
# Output: monthly_interest_rate, loan_duration_months, monthly_payment
# Formula: m = p * (j / (1 - (1 + j)**(-n)))

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def valid_integer?(number)
  number.to_i.to_s == number
end

def valid_float?(number)
  number.to_f.to_s == number
end

def valid_number?(number)
  valid_integer?(number) || valid_float?(number)
end

def prompt(message)
  puts ">> #{MESSAGES[message]}"
end

loan_amount = ''
annual_rate = ''
loan_duration_years = ''

prompt('welcome')

loop do
  loop do
    prompt('loan_amount_prompt')
    loan_amount = gets.chomp()
    break if valid_number?(loan_amount)
    prompt('invalid_input')
  end

  loop do
    prompt('annual_rate_prompt')
    annual_rate = gets.chomp()
    break if valid_float?(annual_rate)
    prompt('invalid_input')
  end

  loop do
    prompt('loan_duration_prompt')
    loan_duration_years = gets.chomp()
    break if valid_number?(loan_duration_years)
    prompt('invalid_input')
  end

  loan_duration_months = loan_duration_years.to_f * 12
  monthly_rate = annual_rate.to_f / 12
  monthly_payment = loan_amount.to_f * (
      monthly_rate / (
          1 - (1 + monthly_rate)**(-loan_duration_months)
        )
    )

  prompt('monthly_payment')
  puts monthly_payment.round(2)

  again = ''
  loop do
    prompt('again')
    again = gets.chomp()
    break if ['y', 'n'].include?(again.downcase)
    prompt('invalid_input')
  end

  break if again.downcase == 'n'
end
