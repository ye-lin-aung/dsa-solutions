$array = [10,4,3,5,1,2,6,7]


def sort(input)
  steps = 0
  current_position = 0
  smallest = input[0]
  $array.each do |item|
    $array.each_with_index do |y,index|
      if y < smallest
        p ""
        p ""
        p "#######################"
        p $array
        p "Index #{index}"
        p "Comparing #{y} and #{smallest}"
        p "Smallest is #{smallest}"
        p "Position is #{current_position}"
        tmp = $array[index]
        $array[index] =  smallest
        $array[current_position] = tmp 
        smallest = tmp
        current_position += 1
        steps += 1
        p $array
        p "--------------------->"
      end
    end
  end
  $array
  #p current_position 
  #p smallest
end


p sort($array)
