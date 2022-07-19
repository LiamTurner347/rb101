=begin
def interleave(arr1, arr2)
  int_arr = []
  arr1.length.times do |i|
    int_arr << arr1[i]
    int_arr << arr2[i]
  end
  int_arr
end

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
=end

def interleave(arr1, arr2)
  int_arr = arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # == [1, 'a', 2, 'b', 3, 'c']