[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# 1
# 3
# => [[1, 2], [3, 4]]

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end

# 1
# 3
# => [nil, nil]

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# 1
# 3
# => [1, 3]

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

p my_arr

# 18
# 7
# 12
# => [[18, 7], [3, 12]]

new_arr = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p new_arr

# => [[2, 4], [6, 8]]

new_hash = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

p new_hash

# => [{ :c => "cat" }]

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

p arr.sort 
# => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

number_sort = arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

p number_sort
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end

# => [[27], ["apple"]]

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end

# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
