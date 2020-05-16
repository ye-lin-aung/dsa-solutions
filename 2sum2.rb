def lowerBound(a, key)
    idx = (0...a.size).bsearch { |i| a[i] >= key }
    idx.nil? ? a.size : idx
end
def upperBound(a, key)
    idx = (0...a.size).bsearch { |i| a[i] > key }
    idx.nil? ? a.size : idx
end

array = File.readlines("2sum3.txt")

array = array.map{ |item| item.to_i }

array = array.sort
s = []
count = 0
hits = {}
(-10000..10001).each do |item|
  hits[item] = 0
end

for x in array
  puts "This is x #{x} in index of #{array.index(x)}"  
  lower = lowerBound(array,-10000 - x)
  upper = upperBound(array,10000 - x)
  puts "Looping from #{(lower...upper)} ==> #{-10000 - x} <> #{10000 - x}"
  for i in (lower...upper)
    y = array[i]
    if x != y
      
      puts "X + Y #{x + y}"
      hits[x + y] = 1
    end
  end
end

puts hits.values().sum()
