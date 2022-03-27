
def oddities(array)
  array.select do |element| 
    array.index(element).even?
  end
end

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

def oddities(array)
  odd_elements = []
  index = 0
  loop do 
    break if index >= array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) # == [1, 3, 5]
p oddities(['abc', 'def']) # == ['abc']
p oddities([123]) # == [123]
p oddities([]) # == []