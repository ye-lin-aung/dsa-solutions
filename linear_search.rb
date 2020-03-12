array = [1,5,2,3,7,8]
search_term = 3

#O(n)
array.each_with_index do |item,index|
  if item == search_term
    puts index;
    break
  end
end
