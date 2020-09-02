@arr = [10,12,1,3,5,9,8,99]

@max = 0

def max
  if @arr.count == 0 
    return 
  elsif @max < @arr.first 
    @max = @arr.first
    @arr.delete_at 0
    max
  else
    @arr.delete_at 0
    max
  end
end

max 
p @max
p @arr
