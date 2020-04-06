
# Pivot should be = [2,1,3,6,7,4,5,8]
array  =[1,6,8,10,7,5,2,9,4,3] 
 # File.readlines("qs_numbers.txt")
 # [10,9,8,7,6,5,4,3,2,1] 
$comparisons = 0
def quickSort(array,low,high)
  # Base case, all divide and conquer methods need base case
  if array.length <= 1
    return array
  end  
  if high > low 
    # Pick last element as pivot    
    p = array[high].to_i
    i = low - 1 
    j = low 
   p "Initial"
   p array
   p "Pivot is #{p}"

    while j < high  
      if array[j].to_i < p
        i += 1
          $comparisons += 1
          p "Swap #{array[j]}, #{array[i]}"
          array[i],array[j] = array[j], array[i]
      else

        $comparisons += 1
      end

      j += 1
    end

    array[high],array[i + 1] = array[i + 1],array[high]
    i = i + 1
    p $comparisons
    p array
    p '---------------------------------------'
    quickSort(array,low, i - 1 )
    quickSort(array, i + 1,high)
  end 
end


#array[0],array[array.length - 1] = array[array.length - 1], array[0]
quickSort(array,0,array.length-1)

array.map{|item| item.to_i }
p $comparisons 
