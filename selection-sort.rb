$array = [10,4,3,1,2,6,7]


def find_smallest(input)
  smallest = input[0]
  smallest_index = 0
  input.each_with_index do |item,index|
    if item < smallest
      smallest_index = index
      smallest = item
    end
  end
  return smallest_index
end

def sort(input)
  sorted_array = []
  input.length.times do |x|
    smallest_index = find_smallest(input)
    sorted_array << input.delete_at(smallest_index)
  end
  sorted_array
end


p sort($array)
