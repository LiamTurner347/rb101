=begin
def multiply_list(arr1, arr2)
  reps = arr1.length
  multiple_array = []
  reps.times do |i|
    multiple_array << (arr1[i] * arr2[i])
  end
  multiple_array
end

def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end
=end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub| sub.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])         # == [27, 50, 77]