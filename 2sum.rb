array = File.readlines("2sum.txt")

array = array.map{ |item| item.to_i }

array = array.sort
count = 0
i = 0
j = array.length - 1
while i < j
  sum = array[i] + array[j]


  if sum < -10000    
    i += 1

    
  elsif sum > 10000
    j -= 1
  else
    (i..j).each do |item|
      sum = array[item] + array[i]
      if sum > 10000        
        break
      end
      if  sum >= -10000 and sum <= 10000
        count += 1
      end      
    end
    i += 1
  end


end
p count
