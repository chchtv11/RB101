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

FACE_CARDS = { 'J' => 'Jack',
                     'Q' => 'Queen',
                     'K' => 'King',
                     'A' => 'Ace'}

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  suits = %w(H C D S)
  cards = ('2'..'10').to_a + %w(J Q K A)
  deck = []
  
  suits.each do |suit| 
    cards.each { |card| deck << [suit, card] }
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
 "#{array[0..-2].join(', ')} and #{array[-1]}"
end

def display_cards(dealer_hand, player_hand)
  prompt("Dealer has: #{format_card_name(dealer_hand[0][1])} and unknown card")
  prompt("You have: #{join_and(player_hand.map { |card| format_card_name(card[1]) })}")
end

def calculate_ace_value(score, ace_count)
  score <= (11 - ace_count) ? (score += (10 + ace_count)) : (score += ace_count)
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
  
  calculate_ace_value(score, card_faces.count('A'))
end

def busted?(hand)
  calculate_score(hand) > 21
end

def detect_winner(dealer_hand, player_hand)
  dealer_score = calculate_score(dealer_hand)
  player_score = calculate_score(player_hand)
  
  if player_score == dealer_score
    prompt("Its a tie!")
  elsif (21 - dealer_score) < (21 - player_score) 
    prompt("Dealer won!")
  else
    prompt("You won!")
  end
end

# binding.pry
loop do
  deck = initialize_deck
  player_hand = deal_cards(deck, 2)
  dealer_hand = deal_cards(deck, 2)
  
  display_cards(dealer_hand, player_hand)
  
  # Player Turn
  answer = nil
  loop do
    prompt("hit or stay?")
    answer = gets.chomp
    
    case answer
      when 'hit'
        then player_hand += deal_cards(deck, 1)
        display_cards(dealer_hand, player_hand)
        break if busted?(player_hand)
      when 'stay'
        break
    end
    
  end
  
  if busted?(player_hand)
    prompt("You busted, Dealer won!")
    break # outer loop
  else
    prompt("You chose to stay!")
  end
  
  # Dealer Turn
  loop do
    break if calculate_score(dealer_hand) >= 17 || busted?(dealer_hand)
    dealer_hand += deal_cards(deck, 1)
    display_cards(dealer_hand, player_hand)
  end
  
  if busted?(dealer_hand)
    prompt("Dealer Busted. You win!")
    break #outer loop
  else 
    display_cards(dealer_hand, player_hand)
    detect_winner(dealer_hand, player_hand)
  end
end
  
  
  



  