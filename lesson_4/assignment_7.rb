produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(hash_name)
  fruit_only = hash_name.select do |key, value|
    value == "Fruit"
  end
end


def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    break if counter == produce_keys.size  
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == "Fruit"
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers


def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]


def multiply(numbers, multiplier)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers.length

    multiplied_numbers << (numbers[counter] * multiplier)
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers # => [1, 4, 3, 7, 2, 6] - not mutated


def select_letter(string, character)
  counter = 0
  returned_string = ""

  loop do
    break if counter == string.length

    if string[counter] == character
      returned_string << string[counter]
    end

    counter += 1
  end

  returned_string
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p question
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => "" 
