
#PP1

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p sorted_arr

#PP2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |hash|
  hash[:published]
end

p sorted_books

#PP3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1["b"][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0]

#PP4

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2
hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] = 4
p hsh2

#PP5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age = munsters.map do |key, value|
  if value["gender"] == "male"
    value["age"]
  else
    0
  end
end.inject(:+)

p male_age

#PP6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}"
end

#PP7

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a 
p b 
p arr

#PP8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = "aeiou"

hsh.each do |_, array|
  array.each do |string|
    string.each_char do |char|
      puts char if vowels.include?(char)
    end
  end
end

#PP9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |sub|
  sub.sort do |a, b|
    b <=> a
  end
end

p sorted_array

#PP10

original_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

increment_arr = original_arr.map do |hash|
  increment_hsh = {}
  hash.each do |key, value|
    increment_hsh[key] = (value + 1)
  end
  increment_hsh
end

p original_arr
p increment_arr

#PP11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
select_arr = arr.map do |sub_arr|
  sub_arr.select do |int|
    int % 3 == 0
  end
end

p select_arr

#PP12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
new_hsh = arr.each_with_object({}) do |element, hash|
  k, v = element
  hash[k] = v
end

p new_hsh

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

#PP13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorarr = arr.sort_by do |subarr|
  subarr.select{ |num| num.odd?}
end

p sorarr

#PP14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

produce_array = hsh.map do |_, value|
  if value[:type] == "fruit"
    value[:colors].map do |color|
      color.capitalize
    end
  else
    value[:size].upcase
  end
end

p produce_array

#PP15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = arr.select do |element|
  element.values.flatten.all? { |num| num.even? }
end

p even_arr

#PP16

def unique_id
  hex_arr = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f]
  first_eight = hex_arr.sample(8).join
  first_four = hex_arr.sample(4).join
  second_four = hex_arr.sample(4).join
  third_four = hex_arr.sample(4).join
  first_twelve = hex_arr.sample(12).join
  "#{first_eight}-#{first_four}-#{second_four}-#{third_four}-#{first_twelve}"
end

p unique_id
p unique_id

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
p generate_UUID