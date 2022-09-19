# You have a bank of switches before you, numbered from 1 to n. 
# Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. 
# You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. 
# On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Input: An integer that represents the total number of switches and also the total number of repetitions
# Output: An array that shows which of the lights are on after n repetitions

# Data structure: Makes sense to use a hash for the switches whereby the key is the number of the switch and the value is true if on and false if off. 

# Algorithm: 
#  Create a hash that represents all of the switches from 1 to input integer with all values initially set to false
#  Loop through the numbers from 1 to the number of switches
#   If the key divided by the number being looped over is 0, change the value of that key from false to nil or vice versa.
#  Once loop completed, iterate through the hash and select those keys for which the value is true. 

def switches(num)
  switch_hash = {}
  (1..num).each { |key| switch_hash[key] = false }
  
  (1..num).each do |num|
    switch_hash.each do |key, value|
      switch_hash[key] = !value if key % num == 0
    end
  end

  switch_hash.select{ |k, v| v == true }.keys
end

p switches(5) == [1, 4]
p switches(10) == [1, 4, 9]
p switches(1000)