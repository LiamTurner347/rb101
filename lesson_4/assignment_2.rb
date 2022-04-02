# STRINGS

str = 'abcdefghi'

p str[2]                # => "c"
p str[2, 3]             # => "cde"
p str[2, 3][0]          # => "c"

string2 = 'The grass is green'
p string2[4, 5]         # => "grass"

# ARRAYS

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

p arr[2]                                    # => "c"
p arr[2, 3]                                 # => ["c", "d", "e"]
p arr[2, 3][0]                              # => "c"
p arr[2, 1]                                 # => ["c"]
p arr[2..2]                                 # => ["c"]

#HASHES

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

p hsh['fruit']                                          # => "apple"
p hsh['fruit'][0]                                       # => "a"

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
p country_capitals.keys                                                     # => [:uk, :france, :germany]
p country_capitals.values                                                   # => ["London", "Paris", "Berlin"]
p country_capitals.values[0]                                                # => "London"

# EXAMPLES

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

p str[-2]                       # => "d"
p arr[-2]                       # => "d"

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

p str[-6]                         # => nil
p arr[-6]                         # => nil
# p arr.fetch(-6)                   # => IndexError


hsh = { :a => 1, 'b' => 'two', :c => nil }

p hsh['b']                                     # => "two"
p hsh[:c]                                      # => nil
p hsh['c']                                     # => nil
p hsh[:d]                                      # => nil

p hsh.fetch(:c)                                # => nil
# p hsh.fetch('c')                               # => KeyError: key not found: "c"
# p hsh.fetch(:d)                                # => KeyError: key not found: :d

str = 'How do you get to Carnegie Hall?'
p arr = str.split                           # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
p arr.join(" ")                             # => "How do you get to Carnegie Hall?"

hsh = { sky: "blue", grass: "green" }
p hsh.to_a                                  # => [[:sky, "blue"], [:grass, "green"]]
p hsh.to_h                                  # => { sky: "blue", grass: "green" }


str = "joe's favorite color is blue"
str[0] = 'J'
str[6] = "F"
str[15] = "C"
str[21] = "I"
str[24] = "B"
p str                                 # => "Joe's Favorite Color Is Blue"

arr = [1, 2, 3, 4, 5]
arr[0] += 1 
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr                   # => [2, 3, 4, 5, 6]

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
p hsh                                                                                 # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }
