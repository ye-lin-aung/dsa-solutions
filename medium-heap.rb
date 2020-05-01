require "pry"
require_relative "heap"


@tmp = File.readlines("medium-heap-testcase3.txt")
@mediums = []

@min_heap = Heap.new(:min)
@max_heap = Heap.new(:max)

def find_medium_maintainence
  @tmp.each do |i|
    @mediums << get_medium(i.to_i)
  end
end

def get_medium(i)
  # Base case
  if @mediums.empty?
    @max_heap.push(i)
  elsif @mediums.size % 2 == 0
    if i > @min_heap.peek()
      @max_heap.push(@min_heap.pop)      
      @min_heap.push(i)
    else 
      @max_heap.push(i)
    end
  else
     if i < @max_heap.peek()
      @min_heap.push(@max_heap.pop)      
      @max_heap.push(i)
    else 
      @min_heap.push(i)
    end

  end
  @max_heap.peek
end


find_medium_maintainence
p (@mediums.sum % 10000)
