require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  puts("=> #{message}")
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

def operation_to_message(op)
  result =  case op
            when "1" then "Adding"
            when "2" then "Subtracting"
            when "3" then "Multiplying"
            when "4" then "Dividing"
            end
  # because we have saved the case statement into a variable, we don't
  # have to rely on the case statement being the last expression in
  # the method. We can add more code and then put 'result' as the last line.
  result
end

prompt(MESSAGES["welcome"])

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ""
  loop do
    prompt(MESSAGES["first_number"])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  number2 = ""
  loop do
    prompt(MESSAGES["second_number"])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["invalid_operator"])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when "1" then number1.to_i + number2.to_i
            when "2" then number1.to_i - number2.to_i
            when "3" then number1.to_i * number2.to_i
            when "4" then number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt(MESSAGES["another_calc"])
  answer = gets.chomp
  break unless answer.downcase().start_with?("y")
end

prompt(MESSAGES["goodbye"])
