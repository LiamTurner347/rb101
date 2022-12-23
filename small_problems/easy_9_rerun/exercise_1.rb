=begin
Create a method that takes 2 arguments, an array and a hash. 
The array will contain 2 or more elements that, 
when combined with adjoining spaces, will produce a person's name. 

The hash will contain two keys, :title and :occupation, and the appropriate values. 
Your method should return a greeting that uses the person's full name, and mentions 
the person's title and occupation.
=end

# Input: An array containing 2 or more elements forming a person's name. A hash containing two keys and appropriate values for the person's name and occupation. 
# Output: A string using the persons full name, and mentioning their title and occupation. 

# Algorithm: 
  # Join the string together with spaces for the name. 
  # Use string interpolation to pull values from the hash for the name and occupation. 

def greetings(array, hash)
  puts "Hello, #{array.join(" ")}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
