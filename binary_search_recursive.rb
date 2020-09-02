require "pry"
@arr = [1,2,3,4,5,6,7,8,9,10]
position = 0
def search(x)
  mid = @arr.length/2
  if x ==  @arr[mid] 
    return "Found"
  elsif x < @arr[mid]
    mid = mid - 1
    @arr.slice!(mid..@arr.length) 
    search(x)
  else
    mid = mid + 1
    @arr.slice!(0..mid) 
    search(x)
  end
end

p search(3)
