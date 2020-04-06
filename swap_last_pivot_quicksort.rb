
# Pivot should be = [2,1,3,6,7,4,5,8]
array  = File.readlines("qs_numbers.txt")
  #[1,6,8,10,7,5,2,9,4,3]

$comparisons = 0
def quickSort(array,low,high)
  # Base case, all divide and conquer methods need base case
  if array.length == 1
    return array
  end  
  if low < high
    # Pick first element as pivot    
    #
    array[low],array[high]=array[high],array[low] 
    p = array[low].to_i
    i = low + 1
    j = low + 1
    while j <= high
      $comparisons += 1
      if array[j].to_i < p
        array[i],array[j] = array[j], array[i]
        i += 1
      end
      j += 1
    end
    array[low],array[i - 1] = array[i - 1],array[low]
    i = i - 1
    quickSort(array,low, i - 1)
    quickSort(array, i + 1,high)
  end 
end


quickSort(array,0,array.length - 1)

p array.map{|item| item.to_i }
p $comparisons 
