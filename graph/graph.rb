require_relative "edge"
class Graph
  attr_accessor :nodes,:edges

  def initialize
    @nodes = []
    @edges = []
  end


  def add_node(node)
    unless nodes.include? node
      nodes << node
      node.graph = self
    end
  end

  def get_node_by_name name
    nodes.select{ |i| i.name == name }.first
  end


  def add_edge(from,to)
    edges << Edge.new(from,to)
  end

  def reverse!
    edges.each do |e|
      e.from,e.to = e.to, e.from
      
    end
  end
  
end
