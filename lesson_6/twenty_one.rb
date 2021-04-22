require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')


SUITS = %w(Hearts Clubs Diamonds Spades)
VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)
DIVIDER = "=============="
WINNING_TOTAL = 21
DEALER_MAX = 17

def prompt(msg)
  puts "=> #{msg}"
end

def get_valid_input(message, *start_char)
  answer = nil
  loop do
    prompt(message)
    answer = gets.strip
    break if answer.downcase.start_with?(*start_char)
    prompt("Sorry that's not a valid response.")
  end
  answer.downcase[0]
end

def start_game
  prompt(MESSAGES['welcome'])
  
  display_rules = get_valid_input(MESSAGES['request_rules'], 'y', 'n')
  prompt(MESSAGES['rules']) if display_rules == 'y'
  
  prompt(MESSAGES['start'])
  gets
end

def initialize_deck
  deck = SUITS.each_with_object([]) do |suit, deck|
    VALUES.each { |value| deck << {suit: suit, value: value} }
  end

  deck.shuffle
end


def join_and(array)
  return array[0] if array.size == 1

  "#{array[0..-2].join(', ')} and #{array[-1]}"
end

def format_hand(hand)
  join_and(hand.map { |card| "#{card[:value]} of #{card[:suit]}" })
end

def total(hand)
  score = 0
  card_values = hand.map { |card| card[:value] }
  card_values.each do |value|
    if %w(King Queen Jack).include?(value)
      score += 10
    elsif value != 'Ace'
      score += value.to_i
    end
  end

  # Aces
  card_values.select { |value| value == 'Ace' }.count.times do
    score <= 10 ? (score += 11) : (score += 1)
  end
  
  score
end

def busted?(total)
  total > WINNING_TOTAL
end

def detect_result(dealer_total, player_total)
  if player_total > WINNING_TOTAL
    :player_busted
  elsif dealer_total > WINNING_TOTAL
    :dealer_busted
  elsif player_total > dealer_total
    :player_won
  elsif dealer_total > player_total
    :dealer_won
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt("You busted! Dealer wins!")
  when :dealer_busted
    prompt("Dealer busted! You win!")
  when :player_won
    prompt("You win!")
  when :dealer_won
    prompt("Dealer wins!")
  when :tie
    prompt("It's a tie!")
  end
end

def play_again?
  answer = get_valid_input("Do you want to play another round? Enter Yes or No", 'y', 'n')
  answer == 'y'
end

def end_round(dealer_cards, player_cards, dealer_total, player_total, wins)
  puts DIVIDER
  prompt("Dealer has #{format_hand(dealer_cards)}, " \
         "for a total of: #{dealer_total}")
  prompt("You have #{format_hand(player_cards)}, "\
         "for a total of: #{player_total}")
  puts DIVIDER

  display_result(dealer_total, player_total)
  puts DIVIDER

  prompt("Dealer has won #{wins[:dealer]} games")
  prompt("You have won #{wins[:player]} games")
  puts DIVIDER
end

def update_wins!(wins, dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  if [:player_won, :dealer_busted].include?(result)
    wins[:player] += 1
  elsif [:dealer_won, :player_busted].include?(result)
    wins[:dealer] += 1
  end
end

def display_game_winner(wins)
  if wins[:dealer] > wins[:player]
    prompt("Dealer won the game with #{wins[:dealer]} rounds won!")
  elsif wins[:player] > wins[:dealer]
    prompt("You won the game with #{wins[:player]} rounds won!")
  else
    prompt("Its a tie!")
  end
end

system 'clear'
start_game
sleep(0.5)

wins = {
  player: 0,
  dealer: 0
}

loop do
  deck = initialize_deck
  player_cards = deck.pop(2)
  dealer_cards = deck.pop(2)

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt("Dealer has: #{format_hand([dealer_cards[0]])} and unknown card")
  prompt("You have: #{format_hand(player_cards)}, "\
         "for a total of: #{player_total}")

  # Player Turn
  player_action = nil
  loop do
    player_action = get_valid_input("hit or stay?", 'h', 's')
    
    system 'clear'

    if player_action == 'h'
      player_cards += deck.pop(1)
      player_total = total(player_cards)

      prompt("You chose to hit!")
      prompt("Your cards are now: #{format_hand(player_cards)}")
      prompt("Your total is now: #{player_total}")
    end

    break if busted?(player_total) || player_action == 's'
  end

  if busted?(player_total)
    update_wins!(wins, dealer_total, player_total)
    end_round(dealer_cards, player_cards, dealer_total, player_total, wins)

    break if wins.values.max >= 5
    play_again? ? next : break
  else
    system 'clear'
    prompt("You stayed at #{player_total}")
    puts DIVIDER
    prompt("Dealer's turn...")
    prompt("Dealer's cards are: #{format_hand(dealer_cards)}")
    prompt("Dealer's total is: #{dealer_total}")
  end

  # Dealer Turn
  loop do
    break if dealer_total >= DEALER_MAX || busted?(dealer_total)

    dealer_cards += deck.pop(1)
    dealer_total = total(dealer_cards)

    prompt("Dealer hits!")
    prompt("Dealer's cards are now: #{format_hand(dealer_cards)}")
    prompt("Dealer's total is now: #{dealer_total}")
  end

  prompt("Dealer stays at #{dealer_total}") if !busted?(dealer_total)

  update_wins!(wins, dealer_total, player_total)
  end_round(dealer_cards, player_cards, dealer_total, player_total, wins)

  break if wins.values.max >= 5
  break unless play_again?
  system 'clear'
end

display_game_winner(wins)
prompt("Thanks for playing! Goodbye.")
