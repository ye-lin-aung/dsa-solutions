# O is sqrt(n)
def search(array, term)
  # First find the block m 
  # m = sqrt(n)
  n = array.size 
  constant_block = Math.sqrt(n).to_i
  m = 0
  index = 0

  while array[m]  <= term && m <= n
      i = m
      m = m + constant_block
  end
  
  # Performs backward linear search
  puts " We are in block of #{m}"
  puts "#{i}..#{m}" 
  while i <= m 
    i += 1
    if i == term
      break
    end
  end

  puts i  
end

array = [1,2,3,4,5,6,7,8,9,10]
term = 7

puts search(array,term)
