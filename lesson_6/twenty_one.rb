require 'pry-byebug'

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITS = %w(H C D S)
VALUES = ('2'..'10').to_a + %w(J Q K A)
FACE_CARDS = { 'J' => 'Jack',
               'Q' => 'Queen',
               'K' => 'King',
               'A' => 'Ace' }

DIVIDER = "=============="

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each { |value| deck << [suit, value] }
  end

  deck
end

def deal_cards(deck, quantity)
  deck.shuffle!.pop(quantity)
end

def format_card_name(card)
  FACE_CARDS.fetch(card, card)
end

def join_and(array)
  case array.size
  when 1
    then array[0]
  else
    "#{array[0..-2].join(', ')} and #{array[-1]}"
  end
end

def format_hand(hand)
  join_and(hand.map { |card| format_card_name(card[1]) })
end

def display_cards(dealer_hand, player_hand, show_dealer_cards=false)
  if show_dealer_cards
    prompt("Dealer has: #{format_hand(dealer_hand)}")
  else
    prompt("Dealer has: #{format_hand([dealer_hand[0]])} and unknown card")
  end

  prompt("You have: #{format_hand(player_hand)}")
end

def calculate_score(hand)
  score = 0
  card_faces = hand.map { |card| card[1] }
  card_faces.each do |face|
    if %w(K Q J).include?(face)
      score += 10
    elsif face != 'A'
      score += face.to_i
    end
  end

  # Aces
  card_faces.select { |face| face == 'A' }.count.times do
    score <= 10 ? (score += 11) : (score += 1)
  end
  score
end

def busted?(hand)
  calculate_score(hand) > 21
end

def detect_result(dealer_hand, player_hand)
  dealer_score = calculate_score(dealer_hand)
  player_score = calculate_score(player_hand)

  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif player_score > dealer_score
    :player_won
  elsif dealer_score > player_score
    :dealer_won
  else
    :tie
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

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
  prompt("Do you want to play again? Enter Yes or No")
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

# binding.pry
system 'clear'
prompt("Welcome to Twenty-One. Let's play!")

loop do
  deck = initialize_deck
  player_hand = deal_cards(deck, 2)
  dealer_hand = deal_cards(deck, 2)

  prompt("Dealer has: #{format_hand([dealer_hand[0]])} and unknown card")
  prompt("You have: #{format_hand(player_hand)}, "\
         "for a total of: #{calculate_score(player_hand)}")

  # Player Turn
  answer = nil
  loop do
    # Validate input
    loop do
      prompt("hit or stay?")
      answer = gets.chomp[0].downcase
      break if ['h', 's'].include?(answer)
      prompt("That's not a valid response. Try again!")
    end

    system 'clear'

    if answer == 'h'
      player_hand += deal_cards(deck, 1)

      prompt("You chose to hit!")
      prompt("Your cards are now: #{format_hand(player_hand)}")
      prompt("Your total is now: #{calculate_score(player_hand)}")
    end

    break if busted?(player_hand) || answer == 's'
  end

  if busted?(player_hand)
    display_result(dealer_hand, player_hand)
    puts DIVIDER
    play_again? ? next : break
  else
    system 'clear'
    prompt("You stayed at #{calculate_score(player_hand)}")
    puts DIVIDER
    prompt("Dealer's turn...")
    prompt("Dealer's cards are: #{format_hand(dealer_hand)}")
  end

  # Dealer Turn
  loop do
    break if calculate_score(dealer_hand) >= 17 || busted?(dealer_hand)
    prompt("Dealer hits!")
    dealer_hand += deal_cards(deck, 1)
    prompt("Dealer's cards are now: #{format_hand(dealer_hand)}")
  end

  if busted?(dealer_hand)
    prompt("Dealer total is now: #{calculate_score(dealer_hand)}")
    display_result(dealer_hand, player_hand)
    play_again? ? next : break
  else
    prompt("Dealer stays at #{calculate_score(dealer_hand)}")
  end

  puts DIVIDER
  prompt("Dealer has #{format_hand(dealer_hand)}," \
         "for a total of: #{calculate_score(dealer_hand)}")
  prompt("Player has #{format_hand(player_hand)}, "\
         "for a total of: #{calculate_score(player_hand)}")
  puts DIVIDER

  display_result(dealer_hand, player_hand)
  break unless play_again?
end

prompt("Thanks for playing! Goodbye.")
