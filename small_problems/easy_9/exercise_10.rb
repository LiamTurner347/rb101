def buy_fruit(shop_arr)
  shop_list = []
  shop_arr.each do |fruit, quantity|
    quantity.times { shop_list << fruit }
  end
  shop_list
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end