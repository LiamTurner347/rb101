# 1. Initialize deck
# 2. Deal cards to player and dealer
#   - show player cards to player - show one of dealer cards to player
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

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
    if value == "A"
      sum += 11
    elsif value.to_i.to_s == value
      sum += value.to_i
    else
      sum += 10
    end
  end
  
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  calculate_total(cards) > 21
end

def hit!(deck, cards)
  cards << deck.slice!(1)
end

def determine_result(player, dealer)
  if calculate_total(player) > calculate_total(dealer)
    "You win"
  elsif calculate_total(player) < calculate_total(dealer)
    "The dealer wins. Booooo"
  else
    "It's a tie!"
  end
end

def play_again?
  prompt("Do you want to play again (y or n)")
  answer = gets.chomp.downcase
  answer.start_with?('y')
end


loop do
  prompt("Let's play 21!")

  # initial deck shuffle and deal
  deck = initialize_deck
  player_cards = initial_deal(deck)
  dealer_cards = initial_deal(deck)

  prompt("Ok, you've got a #{player_cards[0][1]} and a #{player_cards[1][1]}")
  prompt("Dealer has a #{dealer_cards[0][1]} and ?")

  # player turn
  loop do
    answer = nil
    loop do  
      prompt("Your current total is #{calculate_total(player_cards)}")
      prompt("Hit (h) or stay (s)?")
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      prompt "Sorry, you must enter either 'h' or 's'."
    end

    if answer.start_with?('h')
      hit!(deck, player_cards)
      prompt("You chose to hit!")
      prompt("Your cards are now: #{player_cards}")
    end

    break if answer.start_with?('s') || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt("You busted so the dealer wins. Better luck next time champ")
    play_again? ? next : break
  else
    prompt("You chose to stay on #{calculate_total(player_cards)}!")
  end

  # dealer turn
  prompt("Time for the dealer to play")
  loop do 
    break if calculate_total(dealer_cards) >= 17

    prompt("Dealer hits!")
    hit!(deck, dealer_cards)
    prompt("Dealer's cards are now: #{dealer_cards}")
  end
  

  if busted?(dealer_cards)
    prompt("Dealer total is now: #{calculate_total(dealer_cards)}")
    prompt("The dealer busted. You the real champ!")
    play_again? ? next : break
  else
    prompt("The dealer chose to stay at #{calculate_total(dealer_cards)}")
  end

  # both player and dealer stays - compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{calculate_total(dealer_cards)}"
  prompt "You have #{player_cards}, for a total of: #{calculate_total(player_cards)}"
  puts "=============="

  prompt("#{determine_result(player_cards, dealer_cards)}")

  break unless play_again?
end

prompt("Thank you for playing 21!")
