#You are given a sorted (from smallest to largest) array A of n distinct integers which can be positive, negative, or zero. You want to decide whether or not there is an index i such that A[i] = i. Design the fastest algorithm that you can for solving this problem.
#
require "pry"
aarray =* [-2,-1,1,2,4,5,6]
def divide(array,item)
  first = 0
  last = array.length - 1
  while first <= last
    mid = (first + last)/2 
    if array[mid] > item
      last = mid - 1
    elsif array[mid] < item
      first = mid + 1
    elsif mid == item
      return true
    else 
      return false
    end 
  end
end

p divide(aarray.to_ary,4)

binding.pry

