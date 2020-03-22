require "pry"
array = [1,5,6,4,20]

def sort_and_count count,array
  if array.length == 1
    return [0,array]
  end
  first_half = array[0..(array.length/2)-1]
  second_half = array[(array.length/2)..array.length]
  count,x = sort_and_count(count,first_half)
  count2,y = sort_and_count(count,second_half)
  
  sorted3 = []
  j = 0  
  i = 0
  k = 0 
  inversion_count = 0 
  # Merge by second half size
  while i < x.length and j < y.length do 
    if x[i] < y[j]
      sorted3[k] = x[i] 
      i += 1
    else
      sorted3[k] = y[j]
      j += 1
      # Copy remaining inversion count
      inversion_count +=  x.length - i
    end
    k += 1
  end  

  # Copy remaining first half
  while i < first_half.length 
    sorted3[k] = x[i]
    i += 1 
    k += 1
  end

  # Copy remaining second half
  while j < second_half.length 
    sorted3[k] = y[j]
    j += 1 
    k += 1
  end
   
  # Plus all inversion
  return [count + count2 +  inversion_count,sorted3]
end

count = sort_and_count(0,array)

binding.pry


