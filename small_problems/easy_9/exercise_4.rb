def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Further Exploration:
def sequence(number)
  number > 0 ? 1.upto(number).to_a : (number).upto(1).to_a
end