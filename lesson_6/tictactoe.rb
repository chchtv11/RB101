INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagnonals
ROW_SPACER = '     |     |'
COL_SPACER = '  |  '
DIVIDER = '-----+-----+-----'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"

  divider_count = 1

  brd.keys.each_slice(3).to_a.each do |row|
    puts ROW_SPACER
    puts '  ' + row.map { |space| brd[space] }.join(COL_SPACER)
    puts ROW_SPACER

    puts DIVIDER if divider_count <= 2
    divider_count += 1
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def select_first_turn
  choice = ''
  loop do
    prompt("Who should go first?"\
      "Enter P for Player,"\
      "C for Computer,"\
      "or ? to make it random")
    choice = gets.chomp.downcase
    choice = ['p', 'c'].sample if choice.start_with?('?')

    break if choice.start_with?('p') || choice.start_with?('c')

    prompt("That's not a valid response.")
  end

  choice.chars.first
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd, marker)
  squares = []
  WINNING_LINES.each do |line|
    line_values = line.map { |space| brd[space] }
    if (line_values.count(marker) == 2) &
       (line_values.count(INITIAL_MARKER) == 1)
      squares += line.select { |space| brd[space] == INITIAL_MARKER }
    end
  end
  squares.sample
end

def computer_places_piece!(brd)
  defense_square = find_at_risk_square(brd, PLAYER_MARKER)
  offense_square = find_at_risk_square(brd, COMPUTER_MARKER)
  empty_squares = empty_squares(brd)

  square =
    if !!offense_square
      offense_square
    elsif !!defense_square
      defense_square
    elsif empty_squares.include?(5)
      5
    else
      empty_squares.sample
    end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    line_values = line.map { |square| brd[square] }.uniq
    if line_values == [PLAYER_MARKER]
      return 'Player'
    elsif line_values == [COMPUTER_MARKER]
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delim=', ', last_delim='or')
  case arr.size
  when 0
    then ''
  when 1
    then arr[0]
  else
    arr[-1] = "#{last_delim} #{arr[-1]}"
    arr.join(delim)
  end
end

def place_piece!(board, player)
  player == 'p' ? player_places_piece!(board) : computer_places_piece!(board)
end

def alternate_player(player)
  player == 'p' ? 'c' : 'p'
end

scores = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = initialize_board
  current_player = select_first_turn

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    scores[winner] += 1
    prompt "#{winner} won this round!"
  else
    prompt "It's a tie!"
  end

  break if scores.values.max == 5

  prompt('Play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

if scores.values.max == 5
  prompt(scores.select { |_, num| num == 5 }.values[0] + ' won the game!')
end

prompt('Thanks for playing Tic tac Toe! Good bye!')
