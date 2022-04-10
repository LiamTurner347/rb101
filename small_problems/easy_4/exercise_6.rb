def running_total(input_array)
  output_array = []
  input_array.each_with_index do |element, index|
    if index == 0
      output_array << element
    else
      output_array << input_array[0, index + 1].inject(:+)
    end
  end
  output_array
end

p running_total([2, 5, 13]) # == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) # == [14, 25, 32, 47, 67]
p running_total([3]) # == [3]
p running_total([]) # == []