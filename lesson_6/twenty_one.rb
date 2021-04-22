require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

SUITS = %w(Hearts Clubs Diamonds Spades)
VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)
DIVIDER = "=============="
WINNING_TOTAL = 21
DEALER_MAX = 17
ROUND_WINS = 5

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
  system 'clear'
end

def initialize_deck
  deck = SUITS.each_with_object([]) do |suit, array|
    VALUES.each { |value| array << { suit: suit, value: value } }
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

def detect_result(totals)
  if totals[:player] > WINNING_TOTAL
    :player_busted
  elsif totals[:dealer] > WINNING_TOTAL
    :dealer_busted
  elsif totals[:player] > totals[:dealer]
    :player_won
  elsif totals[:dealer] > totals[:player]
    :dealer_won
  else
    :tie
  end
end

def display_result(totals)
  result = detect_result(totals)
  prompt(MESSAGES[result.to_s])
end

def play_again?
  answer = get_valid_input(MESSAGES['play_again'], 'y', 'n')
  answer == 'y'
end

# rubocop:disable  Metrics/AbcSize
def end_round(dealer_cards, player_cards, totals, wins)
  sleep(0.5)
  puts DIVIDER
  prompt("Dealer has #{format_hand(dealer_cards)}, " \
         "for a total of: #{totals[:dealer]}")
  prompt("You have #{format_hand(player_cards)}, "\
         "for a total of: #{totals[:player]}")

  sleep(1)
  puts DIVIDER
  display_result(totals)

  sleep(0.5)
  puts DIVIDER
  prompt("Dealer has won #{wins[:dealer]} games")
  prompt("You have won #{wins[:player]} games")

  puts DIVIDER
  sleep(0.5)
end
# rubocop:enable  Metrics/AbcSize

def update_wins!(wins, totals)
  result = detect_result(totals)
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

def player_hit(deck, player_cards, totals)
  player_cards << deck.pop(1)[0]
  totals[:player] = total(player_cards)

  prompt("You chose to hit!")
  sleep(0.75)

  return if busted?(totals[:player])
  prompt("Your cards are now: #{format_hand(player_cards)}")
  prompt("Your total is now: #{totals[:player]}")
end

def player_turn(deck, player_cards, totals)
  # Player Turn
  player_action = nil
  loop do
    player_action = get_valid_input("hit or stay?", 'h', 's')
    system 'clear'

    player_hit(deck, player_cards, totals) if player_action == 'h'
    break if busted?(totals[:player]) || player_action == 's'
  end
  sleep(0.5)
end

def dealer_hit(deck, dealer_cards, totals)
  loop do
    sleep(0.5)
    break if totals[:dealer] >= DEALER_MAX || busted?(totals[:dealer])

    dealer_cards << deck.pop(1)[0]
    totals[:dealer] = total(dealer_cards)

    prompt("Dealer hits!")
    sleep(0.5)
    prompt("Dealer's cards are now: #{format_hand(dealer_cards)}")
    prompt("Dealer's total is now: #{totals[:dealer]}")
  end
end

def dealer_turn(deck, dealer_cards, totals)
  sleep(0.5)
  prompt("Dealer's turn...")

  sleep(0.5)
  prompt("Dealer's cards are: #{format_hand(dealer_cards)}")
  prompt("Dealer's total is: #{totals[:dealer]}")

  dealer_hit(deck, dealer_cards, totals)

  sleep(0.5)
  prompt("Dealer stays at #{totals[:dealer]}") if !busted?(totals[:dealer])
end

system 'clear'
start_game
prompt("Dealing cards...")
sleep(1)

wins = {
  player: 0,
  dealer: 0
}

loop do
  system 'clear'
  
  deck = initialize_deck
  player_cards = deck.pop(2)
  dealer_cards = deck.pop(2)

  totals = {
    player: total(player_cards),
    dealer: total(dealer_cards)
  }

  prompt("Dealer has: #{format_hand([dealer_cards[0]])} and unknown card")
  prompt("You have: #{format_hand(player_cards)}, "\
         "for a total of: #{totals[:player]}")

  player_turn(deck, player_cards, totals)
  if busted?(totals[:player])
    update_wins!(wins, totals)
    end_round(dealer_cards, player_cards, totals, wins)

    break if wins.values.max >= ROUND_WINS

    sleep(0.5)
    play_again? ? next : break
  else
    sleep(0.5)
    system 'clear'
    prompt("You stayed at #{totals[:player]}")
    puts DIVIDER
  end

  dealer_turn(deck, dealer_cards, totals)

  update_wins!(wins, totals)
  end_round(dealer_cards, player_cards, totals, wins)

  break if wins.values.max >= ROUND_WINS
  break unless play_again?
  system 'clear'
end

display_game_winner(wins)
prompt(MESSAGES['goodbye'])
