# Pivot should be = [2,1,3,6,7,4,5,8]
array  = File.readlines("qs_numbers.txt")
#[2, 20, 1, 15, 3, 11, 13, 6, 16, 10, 19, 5, 4, 9, 8, 14, 18, 17, 7, 12]
#[1,6,8,10,7,5,2,9,4,3] 

p array
 # File.readlines("qs_numbers.txt")
 # [10,9,8,7,6,5,4,3,2,1] 
$comparisons = 0

def median(array)
  sorted = array.map{|item| item.to_i}.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
end

def quickSort(array,low,high)
  # Base case, all divide and conquer methods need base case
  if array.length <= 1
    return array
  end

  if high > low 
    # Pick last element as pivot
    mid = 0

    if array.length % 2 == 0
      mid = (high - low)/2
    else
      mid = (high - low + 1)/2
    end
    mid = low + mid
    
    tmp = [array[low], array[mid], array[high]]
   
    m = median(tmp)
    m_position = low    
    if m == array[mid].to_i   
      m_position = mid
    elsif m == array[high].to_i
      m_position = high
    end
    array[low],array[m_position]=array[m_position],array[low]
    
    p = array[low].to_i
    i = low + 1
    j = low +  1
    
    while j <= high
      $comparisons += 1
      if array[j].to_i < p
        array[i],array[j] = array[j], array[i]
        i += 1
      end
      j += 1
    end
    array[low],array[i - 1] = array[i - 1],array[low]

    puts "\n"
    i = i - 1
    quickSort(array,low, i - 1)
    quickSort(array, i + 1,high)
  end 
end


#array[0],array[array.length - 1] = array[array.length - 1], array[0]
quickSort(array,0,array.length-1)

p array.map{|item| item.to_i }
p $comparisons 
