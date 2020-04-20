class Node
  include Comparable
  attr_accessor :name,:graph
  
  def initialize(name)  
    @name = name
  end

  def adjacents
    graph.edges.select{|e| e.from == self}.map(&:to)
  end
  
  def to_s
    @name
  end
  
  def <=>(other)
    name <=> other.name
  end
end
