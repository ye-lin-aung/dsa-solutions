require "pry"

# Min, Max Heap
class Heap
  attr_accessor :type, :heap, :last, :comparator

  def initialize(type= :min)
    @type = type
    case type
    when :min
      # Infinity
      @heap = [1.0/0]
      @comparator = -> (x,y){ (x <=> y) < 0}
    when :max
      # -Infinity
      @heap = [-1.0/0]
      @comparator = -> (x,y){ (x <=> y) > 0}
    end
    @last = 0
  end
  
  def to_s
    @heap.to_s
  end

  def peek
    # Root node
    heap[1]
  end

  def empty?
    peek.nil? 
  end

  # Insert 
  def push e
    @last += 1
    heap[last] = e
    bubble_up last
    last
  end

  # Deletion of heap
  def pop
    return nil if last == 0
    v = peek
    heap[1] = heap[last]
    heap.delete_at(last)
    @last -= 1
    bubble_down(1)
    v
  end

  def size
    heap.size
  end


  private

  def bubble_up child
    return if child == 1
    parent_index = parent(child)
    if comparator(heap[child], heap[parent_index])    
      heap[child], heap[parent_index] = heap[parent_index], heap[child]
      bubble_up parent_index
    end
  end

  def bubble_down parent_index
    return if parent_index > parent(last)
    left = left_child(parent_index)
    right = right_child(parent_index)
    if right > last
      child = left
    else 
      child = comparator(heap[left],heap[right]) ? left : right
    end
    if comparator(heap[child],heap[parent_index])
      heap[child],heap[parent_index] = heap[parent_index],heap[child]
      bubble_down child
    end
  end

  
  def parent index
    index / 2
  end

  def left_child index
    2 * index
  end

  def right_child index
    2 * index + 1
  end

  def heap
    @heap
  end

  def comparator(x,y)
    @comparator[x,y]
  end

  def type
    @type
  end

  def last
    @last
  end

end
