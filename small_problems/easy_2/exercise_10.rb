array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

puts array2
p array1.object_id == array2.object_id
p array1[1].object_id == array2[1].object_id

=begin
As shown above, it is possible to affect other objects without intending to do so. 
To prevent issues like that above, you can make a shallow copy of the relevant object
before passing it around. This ensures that you aren't referencing the same object
in different parts of the code which can create problems down the line when this object 
is mutated
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

puts array2
p array1.object_id == array2.object_id
p array1[1].object_id == array2[1].object_id