def merge(array1, array2)
  merged_array = array1.concat(array2).flatten.sort.uniq
end

def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) # == [1, 3, 5, 6, 9]