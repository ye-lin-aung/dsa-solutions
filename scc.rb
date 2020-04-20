
$source = nil
$finishing_time = {}
$t = 0
$scc = {}
$visited = []
graph = {}
rev_graph = {}
array = File.readlines("ssc-testcase.txt")
array.each do |item|
  n = item.split(" ")
  if graph[n.first].nil?
    graph[n.first] = []
  end
  if rev_graph[n.last].nil?
    rev_graph[n.last] = []
  end
  graph[n.first] << n.last
  rev_graph[n.last] << n.first
end

def DFS_loop_rev(g)
  g.keys.each do |node|
    unless $visited.include?  node
      DFS_rev(g,node)
    end
  end
end

def DFS_rev(g,n)
  $visited << n
  g[n].each do |edge|
    unless $visited.include? edge
      DFS_rev(g,edge)
    end
  end
  $t += 1
  $finishing_time[n] = $t
end

def DFS(g,n)
  $visited << n
  g[n].each do |edge|
    unless $visited.include? edge
      DFS(g,edge)
      $scc[$source] += 1
    end
  end

end

def DFS_loop(g)
  $visited = []
  p $finishing_time
  f_time = g.keys.sort_by{ |item| $finishing_time[item] }

  f_time.each do |n|
    unless $visited.include? n
      $source = n
      $scc[$source] = 1
      DFS(g,n)
    end
  end
end
p rev_graph
DFS_loop_rev(rev_graph)
DFS_loop(graph)




p $scc.values

#puts graph
#puts rev_graph
#puts $finishing_time
