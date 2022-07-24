require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}"
  puts "Computer is a #{COMPUTER_MARKER}"
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = optimal_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = optimal_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if empty_squares(brd).include?(5)
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

def optimal_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(brd, delimiter = ', ', word = 'or')
  case brd.size
  when 0 then ''
  when 1 then brd.first
  when 2 then brd.join(" #{word} ")
  else
    brd[-1] = "#{word} #{brd.last}"
    brd.join(delimiter)
  end
end

# rubocop:disable Metrics/MethodLength
def starting_player
  player = nil
  loop do
    prompt('Who would you like to go first? (Player, P; Computer, C; Random, R)')
    player = gets.chomp

    if player.downcase.start_with?('p')
      player = 'Player'
    elsif player.downcase.start_with?('c')
      player = 'Computer'
    elsif player.downcase.start_with?('r')
      player = %w(Player Computer).sample
    end

    break if %w(Player Computer).include?(player)

    prompt('Sorry, that is not a valid input. Try again')
  end
  player
end
# rubocop:enable Metrics/MethodLength

def place_piece!(brd, player)
  if player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

def display_score(scr)
  prompt("Player score: #{scr[:player]}; Computer score: #{scr[:computer]}")
end

def someone_won_to_five?(scr)
  !!winner_to_five(scr)
end

def winner_to_five(scr)
  return 'Player' if scr[:player] == 5
  return 'Computer' if scr[:computer] == 5

  nil
end

def greeting
  prompt('Welcome to Tic Tac Toe!')
  prompt('Take turns placing symbols in a 3x3 grid')
  prompt('Get three in a row to win the match!')
  prompt('First to five matches wins the game')
end

greeting
score = { player: 0, computer: 0 }

loop do
  board = initialize_board
  current_player = starting_player

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won_round?(board)
    prompt("#{detect_winner(board)} won this game!")
    detect_winner(board) == 'Player' ? score[:player] += 1 : score[:computer] += 1
  else
    prompt("It's a tie!")
  end

  display_score(score)
  if someone_won_to_five?(score)
    winner = winner_to_five(score)
    prompt("#{winner} won first to five!")
  end

  prompt('Play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing Tic Tac Toe. Good bye!')
