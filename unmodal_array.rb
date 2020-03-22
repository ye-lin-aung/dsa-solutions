require "pry"

array =  [1,23,50,100,30,20,2]


# Unmodal array implementation
def divide(array)
  if array.length == 1
    return array
  end
  if array.length == 2
    if array[1] > array[0]
      return [array[1]]
    end
    return [array[0]]
    
  end
  first_half = array[0..(array.length/2)-1]
  second_half = array[(array.length/2)..array.length]
  if second_half[0] > first_half[0]
    # 1 Recursive
    return divide(second_half)
  else
    return divide(first_half)
  end
end

count = divide(array)
binding.pry
