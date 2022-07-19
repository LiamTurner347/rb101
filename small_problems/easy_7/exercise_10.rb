=begin
def penultimate(string)
  array = string.split
  array[-2]
end

p penultimate('last word') # == 'last'
p penultimate('Launch School is great!') # == 'is'
=end

def middle(string)
  array = string.split
  index = array.length / 2
  array[index]
end

p middle('my name is Frank and I like Cheetos alot')
p middle('I get all the girls boi')