name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

=begin
Will print:
Alice
Bob
=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
Will print:
BOB
BOB
=end