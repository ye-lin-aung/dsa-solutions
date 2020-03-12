array = [1,5,2,3,7,8]

#O(n)
def search(array,search_term)
array.each_with_index do |item,index|
  if item == search_term
    return index;
  end
end
return -1;
end

puts search(array,3)
