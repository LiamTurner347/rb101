# Problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}

flintstones.each_with_index do |element, index|
  hash[element] = index
end

p hash

# Problem 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_added = ages.values.inject(:+)

p ages_added

# Problem 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if do |key, value|
  value >= 100
end

p ages

# Problem 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_in_order = ages.values.min
p ages_in_order

# Problem 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Beatrix)

flintstones.each_with_index do |element, index|
  if element.start_with?("Be")
    puts index
    break
  end
end

# Problem 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end

p flintstones

# Problem 7

statement = "The Flintstones Rock"
count_hash = {}

statement.each_char do |char|
  if count_hash.key?(char)
    count_hash[char] += 1
  else 
    count_hash[char] = 1
  end
end

p count_hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
p letters

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
p result

# Problem 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 2 

# Problem 9

words = "the flintstones rock"
p words.split.map { |word| word.capitalize }.join(" ")
p words

# Problem 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end 
end

p munsters