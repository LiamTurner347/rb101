def triangle(num)
  (1..num).each do |value| 
    puts ("*" * value).rjust(num)
  end
end

triangle(5)

triangle(9)
