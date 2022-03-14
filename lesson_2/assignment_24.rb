VALID_CHOICES = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
WIN_RULES = {
  Rock: ["Scissors", "Lizard"],
  Paper: ["Rock", "Spock"],
  Scissors: ["Paper", "Lizard"],
  Lizard: ["Spock", "Paper"],
  Spock: ["Scissors", "Rock"]
}

def prompt(message)
  puts("=> #{message}")
end

def display_input_request
  puts <<-MSG
    Choose one by typing the whole word or the shortcut in brackets:
    Rock (r);
    Paper (p);
    Scissors (sc);
    Lizard (l);
    Spock (sp).
  MSG
end

def validate_input
  input = ""
  loop do
    display_input_request
    input = gets.chomp.capitalize
    input = convert_if_shortcut(input)

    break if valid_input?(input)
    prompt("#{input} is not a valid choice")
  end
  input
end

def convert_if_shortcut(input)
  if input.length <= 2
    convert_shortcut(input)
  else
    input
  end
end

def convert_shortcut(string)
  case string
  when "R"  then "Rock"
  when "P"  then "Paper"
  when "Sc" then "Scissors"
  when "L"  then "Lizard"
  when "Sp" then "Spock"
  else      string
  end
end

def valid_input?(string)
  VALID_CHOICES.include?(string)
end

def win_round?(first, second)
  WIN_RULES[first.to_sym].include?(second)
end

def display_scoreboard(player, computer)
  prompt("The score is Computer: #{computer}, You: #{player}")
end

def display_choices(player_choice, computer_choice)
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
end

def review_round(player, computer)
  if win_round?(player, computer)
    "Player"
  elsif win_round?(computer, player)
    "Computer"
  else
    "Tie"
  end
end

def display_round_result(result)
  case result
  when "Player"
    prompt("Easy work. You won that round")
  when "Computer"
    prompt("Uh-oh. The computer took that round")
  else
    prompt("It's a draw. We go again!")
  end
end

def win_check?(player, computer)
  player == 3 || computer == 3
end

def display_champ(player)
  prompt("It's all over!")
  if player == 3
    prompt("You won - you are the champ!!")
  else
    prompt("You have been defeated by the computer")
  end
end

def play_again?
  prompt("Do you want to play again? (press 'y' to play again)")
  answer = gets.chomp
  answer.downcase.start_with?("y")
end

prompt("Welcome to #{VALID_CHOICES.join(', ')}")

loop do
  player_score = 0
  computer_score = 0

  loop do
    player_choice = validate_input
    computer_choice = VALID_CHOICES.sample

    display_choices(player_choice, computer_choice)

    round_winner = review_round(player_choice, computer_choice)
    display_round_result(round_winner)

    player_score += 1 if round_winner == "Player"
    computer_score += 1 if round_winner == "Computer"

    display_scoreboard(player_score, computer_score)

    if win_check?(player_score, computer_score)
      display_champ(player_score)
      break
    end

    system "clear"
  end

  break unless play_again?
end

prompt("Thank you for playing #{VALID_CHOICES.join(', ')}")
