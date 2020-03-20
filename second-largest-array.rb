require "pry"

$STEP = 0
d = [10,3,4,1,5,6,7,8,9,2,11,12,13,14,15,16]
def divide data
  if data.length == 1
    return data[0],[]
  else
    max0,t0 = divide(data[0..(data.length/2)-1])
    max1,t1 = divide(data[(data.length/2)..data.length])
    if max1 > max0
      t1.append(max0)
      $STEP += 1 
      return max1,t1
    else
      $STEP += 1
      t0.append(max1)
      return max0,t0
    end
  end

end

a = divide d

binding.pry
