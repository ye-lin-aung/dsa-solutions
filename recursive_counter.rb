@arr = [1,2,3,4,5,6,7]
@count = 0


def count
  if @arr.empty?
    @count
  else
    @arr.delete_at 0 
    @count += 1
    count
  end
end
count
p @count
