cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

sum = 0
deck.each_value do |remaining_cards|
    remaining_cards.each do |card|
      sum += score(card) 
    end
end

puts sum
deck.each_value { |x| puts x.length }


# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
sum = 0
deck.each_value do |remaining_cards|
    remaining_cards.each do |card|
      sum += score(card) 
    end
end

deck.each_value { |x| puts x.length }
puts sum
puts player_cards