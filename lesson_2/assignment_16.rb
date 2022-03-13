# Ask user for loan amount - loop
# Ask user for APR - loop
# Ask user for loan duration in years - loop
# Calculate loan duration in months (years / 12)
# Calculate monthly interest rate ((APR / 100) / 12)
# Calculate monthly payment (method)

def prompt(message)
  puts("$ #{message}")
end

def valid_number?(number)
  valid_integer?(number) || valid_float?(number)
end

def valid_integer?(input)
  input.to_i.to_s == input
end

def valid_float?(input)
  input.to_f.to_s == input
end

def monthly_payment(amount, term, mpr)
  monthly_payment = amount * (mpr / (1 - (1 + mpr)**(-term)))
  monthly_payment.round(2)
end

prompt("Welcome to the best mortgage calculator on the web")

loop do
  loan_amount = ""
  loop do
    prompt("How much is your loan in £ (GBP)?")
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt("That doesn't look like a valid loan amount. Please re-enter")
    end
  end

  apr = ""
  loop do
    prompt("What is your APR in %? (E.g. if 5%, type '5')")
    apr = gets.chomp

    if valid_number?(apr)
      break
    else
      prompt("Now then big man - please re-enter a valid number")
    end
  end

  loan_term_years = ""
  loop do
    prompt("How many years are left on your loan? Please enter a number")
    loan_term_years = gets.chomp

    if valid_number?(loan_term_years)
      break
    else
      prompt("Now then big man - please re-enter a valid number")
    end
  end

  loan_figure = loan_amount.to_i
  loan_term_months = loan_term_years.to_i * 12
  mpr = (apr.to_f / 100) / 12

  result = monthly_payment(loan_figure, loan_term_months, mpr)

  prompt("Your monthly payment will be £#{result}")

  prompt("Would you like to run another calculation? Type 'y' to go again")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Goodbye young Padawan")
