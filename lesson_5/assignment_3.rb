arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

p arr[0]              # => ["a", ["b"]]
p arr[0][1][0]        # => "b"
p arr[1]              # => { :b => "bear", :c => "cat" }
p arr[1][:b]          # => "bear"
p arr[1][:b][0]       # => "b"
p arr[2][2]           # => "b"

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

p arr1                        # => ["a", "b", "c"]
p arr2                        # => ["A", "B", "C"]

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

p arr1                          # => ["A", "B", "C"]
p arr2                          # => ["A", "B", "C"]