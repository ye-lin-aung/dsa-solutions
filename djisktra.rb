
graph = {}

array = File.readlines("dijkstraData.txt")

array.each do |item|
  n = item.split(" ")
  graph[n.first] = n[1..n.length]
end
source = graph.keys.first
dist = {}
@searched = []

@q = []
graph.keys.each do |g|  
  dist[g] = 1000000
  @q << g 
end
@searched << source
dist[source] = 0


scores = []
while @searched.length != @q.length
  min = 1000000
  v_select = "";
  w_select = "";
  @q.each do |v|
    graph[v].each do |k|
      w  = k.split(",").first
      len = k.split(",").last
      unless @searched.include? w
        l = dist[v] + len.to_i
        if min > l
          min = l
          v_select = v;
          w_select = w;
          dist[w] = dist[v] + len.to_i
        end
      end
    end
  end
  @searched << w_select






  
end


p scores.sort[99]

p [dist["7"],dist["37"],dist["59"],dist["82"],dist["99"],dist["115"],dist["133"],dist["165"],dist["188"],dist["197"]].join(",")
