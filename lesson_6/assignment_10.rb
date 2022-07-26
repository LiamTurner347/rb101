SUITS = %w(♥ ♦ ♣ ♠)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
GAME_GOAL = 31
DEALER_GOAL = GAME_GOAL - 4

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def initial_deal(deck)
  deck.slice!(0, 2)
end

def calculate_total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i.to_s == value
      sum += value.to_i
    else
      sum += 10
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > GAME_GOAL
  end

  sum
end

def busted?(total)
  total > GAME_GOAL
end

def hit!(deck, cards)
  cards << deck.slice!(1)
end

def determine_result(player_ttl, dealer_ttl, scr)
  if player_ttl > dealer_ttl
    scr[:player] += 1
    'You win'
  elsif player_ttl < dealer_ttl
    scr[:dealer] += 1
    'The dealer wins. Booooo'
  else
    "It's a tie!"
  end
end

def play_again?
  prompt('Do you want to play again (y or n)')
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

def output_totals(player_crd, dealer_crd, player_ttl, dealer_ttl)
  puts '=============='
  prompt "Dealer has #{dealer_crd}, for a total of: #{dealer_ttl}"
  prompt "You have #{player_crd}, for a total of: #{player_ttl}"
  puts '=============='
end

def display_score(scr)
  prompt("The score is - You: #{scr[:player]}; Dealer: #{scr[:dealer]}")
end

def greeting
  system 'clear'
  prompt("Welcome to #{GAME_GOAL}!")
  prompt("Draw cards and get as close to #{GAME_GOAL} as possible")
  prompt("If you land on more than #{GAME_GOAL}, you're bust!")
  prompt('If you bust, the dealer wins.')
  prompt("If you don't bust, it's the dealer's turn and closest to #{GAME_GOAL} wins the game!")
  prompt('First to five games wins the match!')
end

def champion(scr)
  if winner_to_five(scr) == 'You'
    prompt('You won first to five! Game, set and match.')
  elsif winner_to_five(scr) == 'Dealer'
    prompt('Dealer won first to five! Better luck next time champ.')
  end
end

def someone_won_to_five?(scr)
  !!winner_to_five(scr)
end

def winner_to_five(scr)
  return 'You' if scr[:player] == 5
  return 'Dealer' if scr[:dealer] == 5

  nil
end

greeting
score = { player: 0, dealer: 0 }

loop do
  # initial deck shuffle and deal
  deck = initialize_deck
  player_cards = initial_deal(deck)
  dealer_cards = initial_deal(deck)
  player_total = calculate_total(player_cards)
  dealer_total = calculate_total(dealer_cards)

  prompt("Ok, you've got a #{player_cards[0][1]} and a #{player_cards[1][1]}")
  prompt("Dealer has a #{dealer_cards[0][1]} and ?")

  # player turn
  loop do
    answer = nil
    loop do
      prompt("Your current total is #{player_total}")
      prompt('Hit (h) or stay (s)?')
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)

      prompt "Sorry, you must enter either 'h' or 's'."
    end

    if answer.start_with?('h')
      hit!(deck, player_cards)
      player_total = calculate_total(player_cards)
      prompt('You chose to hit!')
      prompt("Your cards are now: #{player_cards}")
    end

    break if answer.start_with?('s') || busted?(player_total)
  end

  if busted?(player_total)
    score[:dealer] += 1
    output_totals(player_cards, dealer_cards, player_total, dealer_total)
    prompt('You busted so the dealer wins. Better luck next time champ')
    display_score(score)
    if someone_won_to_five?(score)
      champion(score)
      break
    end
    play_again? ? next : break
  else
    prompt("You chose to stay on #{player_total}!")
  end

  # dealer turn
  prompt('Time for the dealer to play')
  loop do
    break if dealer_total >= DEALER_GOAL

    prompt('Dealer hits!')
    hit!(deck, dealer_cards)
    prompt("Dealer's cards are now: #{dealer_cards}")
    dealer_total = calculate_total(dealer_cards)
  end

  if busted?(dealer_total)
    score[:player] += 1
    output_totals(player_cards, dealer_cards, player_total, dealer_total)
    prompt('The dealer busted. You the real champ!')
    display_score(score)
    if someone_won_to_five?(score)
      champion(score)
      break
    end
    play_again? ? next : break
  else
    prompt("The dealer chose to stay at #{dealer_total}")
  end

  # both player and dealer stays - compare cards!
  output_totals(player_cards, dealer_cards, player_total, dealer_total)

  prompt("#{determine_result(player_total, dealer_total, score)}")
  display_score(score)

  if someone_won_to_five?(score)
    champion(score)
    break
  end

  break unless play_again?
end

prompt("Thank you for playing #{GAME_GOAL}!")
