# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.


player_cards
dealer_cards

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
SUITS = [:hearts, :diamonds, :clubs, :spades]

def initialize_deck
  SUITS.each_with_object({}) { |suit, deck| deck[suit] = CARDS.dup }
end

def deal_cards(deck)
  cards_dealt = SUITS.to_h { |suit| [suit, []] }
  
  2.times do
    suit = deck.keys.sample
    cards = deck[suit]
    cards.shuffle!
    cards_dealt[suit] += [cards.pop]
    cards.sort_by! {|card| CARDS.index(card) }
  end
  cards_dealt
end
  
  