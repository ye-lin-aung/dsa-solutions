def get_vertices(map)
  vertex = map.keys.sample
  edges = map[vertex]
#  p "VERTEX #{vertex}"

  random_edge = edges.sample
 # p "RANDOM EDGE #{edges}"
  #p "RANDOM EDGE #{random_edge}"
  return vertex,random_edge
end

def remove_vertex(map,v2)
  map.delete(v2)
end

def convert_vertex(map,v2,v1)
  map.each do |key,value|
    value.each_with_index do |i, index|
      if i == v2
        map[key][index] = v1
      end
    end
  end
end

def remove_loops(map,v1)
  map[v1] = get_edges(map,v1).select{ |item| item != v1} 
end


def get_edges(map,key)
  map[key]
end

def merge_edges(map,v1,v2)
  (get_edges(map,v1) +   get_edges(map,v2))
end

# If more than 2 vertices
def find_cut(map)
  while map.length > 2
    # This is ok
    v1,v2 = get_vertices(map)
    # Merge 
    map[v1] = merge_edges(map,v1,v2)
    # Delete
    remove_vertex(map,v2)
    # Remove occurences
    convert_vertex(map,v2,v1)
    # Remove loops
    remove_loops(map,v1)

  end
end

frequency = []
100.times do
  array = File.readlines("mincut.txt")
  map = {}

  array.each{ |i|
    a = i.split(" ")
    map[a.first] = a[1..a.length]
  }
  
  find_cut(map)
  if map[map.keys[0]].length == 17
    p map 
  end
  frequency <<  map[map.keys[0]].length
end

puts frequency.min

# Load graph as a hash
