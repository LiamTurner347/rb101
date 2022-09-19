def swap_name(name_str)
  name_arr = name_str.split
  "#{name_arr.last}, #{name_arr.first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

def swap_name(name)
  name.split(' ').reverse.join(', ')
end