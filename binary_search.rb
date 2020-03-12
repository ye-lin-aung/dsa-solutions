array = [1,2,3,4,5,6,7,8,9,10,11]
# Binary Search O(log n)
#

def search(an_array,item)
  first = 0
  last = an_array.length - 1 
  while first  <= last
    i = (first + last) / 2
    if an_array[i] == item
      puts "Found"
      puts "#{item}"
      return
      # 6 <  5
      # first = 6
    elsif an_array[i] < item  
         first = i + 1

    elsif an_array[i] > item 
         last = i - 1
    else
      # 6 > 5
      # last = 5
    end
  end
end
puts search(array,4)
puts search(array,5)
puts search(array,6)
puts search(array,11)
puts search(array,8)
