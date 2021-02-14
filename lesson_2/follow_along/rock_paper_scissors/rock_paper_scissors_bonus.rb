VALID_CHOICES = %w(rock paper scissors lizard Spock)
WINNING_LOGIC = {
  'scissors' => ['paper', 'lizard'],
  'paper' => ['rock', 'Spock'],
  'rock' => ['lizard', 'scissors'],
  'lizard' => ['Spock', 'paper'],
  'Spock' => ['scissors', 'rock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNING_LOGIC[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def tally_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def announce_winner(score)
  winner = score.key(5)
  if winner == 'computer'
    puts "Computer won!"
  elsif winner == 'player'
    puts 'You have won!'
  end
end

valid_choices_short = VALID_CHOICES.map { |option| option[0] }
score = {
  player: 0,
  computer: 0
}

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice_short = Kernel.gets().chomp()[0]

    if valid_choices_short.include?(choice_short)
      choice = VALID_CHOICES.select { |n| n.start_with?(choice_short) }.first()
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  tally_score(choice, computer_choice, score)
  Kernel.puts(
    "Your score is #{score[:player]};"\
    " Computer score is #{score[:computer]}"
  )

  if score.values.max == 5
    announce_winner(score)
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
