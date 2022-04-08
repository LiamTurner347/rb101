[1, 2, 3].select do |num|
  num > 5
  'hi'
end

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

[1, 2, 3].reject do |num|
  puts num
end

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

hash = { a: 'ant', b: 'bear' }
p hash
p hash.shift
p hash

['ant', 'bear', 'caterpillar'].pop.size

answer = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

p answer

arr = [1, 2, 3, 4, 5]
p arr.take(2)
p arr

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end