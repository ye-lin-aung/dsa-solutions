@arr = [1,4,5,6,11,2]
@count = 0
def sum
  if @arr.empty?
    @count
  else 
    tmp = @arr.first
    @arr.delete_at 0
    @count += tmp + sum
  end
end
sum
p @count
