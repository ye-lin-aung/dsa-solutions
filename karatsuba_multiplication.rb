class String
  def halves
      [self[0, size/2], self[size/2..-1]]
  end
end

def multiply(x,y)

  if x.to_s.length <= 2 or y.to_s.length <= 2
    return x.to_i * y.to_i
  end



  a,b = x.to_s.halves


  c,d = y.to_s.halves


  ac = multiply(a, c)
  bd = multiply(b, d)
  abcd = multiply((a.to_i + b.to_i),(c.to_i + d.to_i)) 
  p "A is #{x}"
  p "B is #{y}"
  ad_plus_bc = ((abcd -  ac) - bd)
  return ((10 ** x.to_s.length) * ac) + (10 ** (x.to_s.length/2) * ad_plus_bc) + bd

end
puts "5678 * 1234"
puts multiply("5678", "1234")
#puts "3141592653589793238462643383279502884197169399375105820974944592".length
#puts "2718281828459045235360287471352662497757247093699959574966967627".length
puts multiply("3141592653589793238462643383279502884197169399375105820974944592","2718281828459045235360287471352662497757247093699959574966967627")
