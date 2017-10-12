require 'set'

# implements a disjoint set with rank heuristics
# and path compression
class DisjointSet
  def initialize
    @rank   = [0]
    @parent = [0]
    @weight = [0]
    @maxWeight = -1.0 / 0.0 # negative infinity
    @maxHistory = []
  end

  def makeSet(i, weight = 0)
    @rank[i]   = 0
    @parent[i] = i

    @maxWeight = weight if @maxWeight < weight
    @weight[i] = weight
  end

  def size
    @parent.size -1
  end

  def printMaxWeight
    puts @maxWeight
  end

  def logMaxWeight
    @maxHistory << @maxWeight
  end

  def printMaxHistory
    puts @maxHistory.join("\n")
  end

  # find the root of the tree which is
  # the id of its set
  def find(i)
    if(i != @parent[i])
      # path compression
      @parent[i] = find(@parent[i])
    end
    @parent[i]
  end

  def union(i, j)
    i_id = find(i)
    j_id = find(j)
    if i_id == j_id
      return
    end
    # move the j_id tree under the i_id tree
    if(@rank[i_id] > @rank[j_id])
      @parent[j_id] = i_id
      mergeWeights(i_id,j_id)
    else
      @parent[i_id] = j_id
      mergeWeights(j_id,i_id)
      # increase rank if both trees have the same rank
      # without path compression this equals the heights
      if(@rank[i_id] == @rank[j_id])
         @rank[j_id] = @rank[j_id] + 1
      end
    end
  end

  # merge the weight from j into i,
  # set the weight of j to 0
  def mergeWeights(i,j)
    sum = @weight[i] + @weight[j]
    @weight[i] = sum
    @weight[j] = 0

    # keep track of the maximum
    @maxWeight = sum if sum > @maxWeight
  end
end


# simulate 1-indexed array via hash
class HashQueue
  def initialize(data)
    @data = {}
    data.each_with_index do |v, i|
      @data[i] = v
    end
    @data.delete(0)
  end

  def empty?
    @data.empty?
  end

  def include?(val)
    @data.include?(val)

  end

  def change_priority(i, val)
    @data[i] = val
  end

  def extract_min
    index, min = @data.min{|(k1,v1),(k2,v2)| v1 <=> v2}
    @data.delete(index)
    index
  end
end

module Graph
  def build_directed_adjacency_list(nodes, edges)
    # NOTE: this is way to slow since we need
    # all the edges as keys anyway
    adj = {}
    nodes.each do |v|
      adj[v] = []
    end

    edges.each do |(x,y)|
      adj[x] = adj[x].push(y)
    end

    adj
  end
  module_function :build_directed_adjacency_list

  def build_undirected_adjacency_list(nodes, edges)
    adj = {}
    nodes.each do |v|
      adj[v] = []
    end

    edges.each do |(x,y)|
      adj[x] << y unless adj[x].include?(y)
      adj[y] << x unless adj[y].include?(x)
    end

    adj
  end
  module_function :build_undirected_adjacency_list

  def explore(v, adj, visited, previsit = nil, postvisit = nil)
    # puts "visiting #{v}"
    if previsit
      res = previsit.call(v)
      return true if res == true
    end

    ws = adj[v]

    visited[v] = true

    ws.each do |w|
      if ! visited[w]
        result = explore(w, adj, visited, previsit, postvisit)
      end
    end
    postvisit.call(v) if postvisit
  end
  module_function :explore


  def has_cycle?(adj)
    has_cycle = false
    vertex_stack = []

    adj.each do |v, _ws|

      # build a new stack for each exploration
      visited = Hash.new{ false }

      previsit = lambda do |v|
        if adj[v].any?{|w| vertex_stack.include?(w)}
          has_cycle = true
        end
        vertex_stack.push(v);
      end

      postvisit = lambda do |v|
        vertex_stack.pop
      end

      # use next to ensure we dont increment the cc id
      # for nodes that are skipped due to already being visited
      next if visited[v]

      res = Graph.explore(v, adj, visited, previsit, postvisit)
    end
    has_cycle
  end
  module_function :has_cycle?

  def toposort(adj)
    previsit = nil
    topology    = []
    visited = Hash.new{ false }

    adj.each do |v, _ws|
      postvisit = lambda do |v|
        topology.unshift(v)
      end

      next if visited[v]

      Graph.explore(v, adj, visited, previsit, postvisit)
    end
    return topology
  end
  module_function :toposort

  # in order to calculate the preorder value
  # just adopt the postorder implementation / hook
  def dfs(adj)
    previsit = nil
    visited = Hash.new{ false }
    postorder_i = 0
    postorder   = Hash.new{nil}

    adj.each do |v, _ws|
      postvisit = lambda do |v|
        postorder_i += 1
        postorder[v] = postorder_i
      end

      next if visited[v]

      Graph.explore(v, adj, visited, previsit, postvisit)
    end
    return postorder
  end
  module_function :dfs

  def relax(dist, weights, prev, u, v)
    if dist[v] > dist[u] + weights[u][v]
      dist[v] = dist[u] + weights[u][v]
      prev[v] = u
    end
  end
  module_function :relax

  def negative_cycle?(nodes, edges, weights)
    # NOTE using INFINITY breaks the relax function since INF > INF - 1 is false
    dist = Array.new(nodes.length() + 1){ 1_000_000_000_000_000_000 }
    prev = Array.new(nodes.length() + 1){ nil }
    s = nodes.first

    dist[s] = 0

    (nodes.length() -1).times do
      edges.each do |u,v|
        relax(dist, weights, prev, u, v)
      end
    end

    has_cycle = false
    cycle = []

    edges.each do |u,v|
      if dist[v] > dist[u] + weights[u][v]
        dist[v] = dist[u] + weights[u][v]
        prev[v] = u

        cycle << [u,v]
        has_cycle = true
      end
    end

    # if has_cycle
    #   puts "found negative weight cycle"
    #   puts weights.inspect
    #   puts cycle.inspect
    # end

    has_cycle
  end
  module_function :negative_cycle?

  def in_negative_cycle?(adj, nodes, edges, weights, s)
    # NOTE using INFINITY breaks the relax function since INF > INF - 1 is false
    dist = Array.new(nodes.length() + 1){ Float::INFINITY }
    prev = Array.new(nodes.length() + 1){ nil }

    dist[s] = 0

    (nodes.length() -1).times do
      edges.each do |u,v|
        relax(dist, weights, prev, u, v)
      end
    end

    has_cycle = false
    cycle = []

    edges.each do |u,v|
      if dist[v] > dist[u] + weights[u][v]
        dist[v] = dist[u] + weights[u][v]
        prev[v] = u

        cycle << u
        has_cycle = true
      end
    end

    if has_cycle
      # puts "found negative cycle: #{cycle.inspect}"
      dist2 = bfs(adj, s, cycle)

      # s_in_cycle = dist2[s] != Float::INFINITY
      # if s_in_cycle
      #   puts "#{s} is in negative cycle #{cycle.inspect}"
      # else
      #   puts "#{s} is NOT in negative cycle #{cycle.inspect}"
      # end
    else
      # puts "No cycle"
      dist2 = Array.new(adj.keys.length() + 1){ Float::INFINITY }
    end

    reachable_from_s = bfs(adj, s)
    # puts "bfs from S: #{reachable_from_s.inspect}"
    # puts "bfs for negative cycle: #{dist2.inspect}"
    # puts "result of bellman ford: #{dist.inspect}"

    result = dist.map.with_index do |distance, i|
      # is part of a negative cycle and the cycle includes S
      if reachable_from_s[i] == Float::INFINITY
        "*"
      else
        if dist2[i] != Float::INFINITY
          "-"
        else
          distance.to_s
        end
      end
    end

    # remove whatever is on position with index 0
    result.shift

    return result
  end
  module_function :in_negative_cycle?

  def dijkstra(adj, weights, s, t)
    dist = Array.new(adj.keys.length() + 1){ Float::INFINITY }
    prev = Array.new(adj.keys.length() + 1){ nil }

    dist[s] = 0
    q = HashQueue.new(dist)

    while !q.empty? do
      u = q.extract_min

      adj[u].each do |v|
        if dist[v] > dist[u] + weights[u][v]
          # puts "updating dist #{dist[v]} of #{v} to dist #{dist[u]} of #{u} + weight #{weights[u][v]}"
          dist[v] = dist[u] + weights[u][v]
          prev[v] = u
          q.change_priority(v, dist[v])
        end
      end
    end
    return dist[t]
  end
  module_function :dijkstra

  def bfs(adj, s, queue = [s])
    dist = Array.new(adj.keys.length() + 1){ Float::INFINITY}

    q = queue.dup
    dist[queue.first] = 0

    while !q.empty? do
      u = q.shift
      adj[u].each do |v|
        # does this already imply visited?
        if dist[v] == Float::INFINITY
          q.push  v
          dist[v] = dist[u] + 1
        end
      end
    end

    dist
  end
  module_function :bfs

  def distance(adj, u, v)
    # The assignment states the u /= v
    # return 0 if u == v
    return -1 unless adj.has_key?(u)
    return -1 unless adj.has_key?(v)

    dists = Graph.bfs(adj, u)
    result = dists[v]

    result == Float::INFINITY ? -1 : result
  end
  module_function :distance

  def bipartite(adj)
    nodes   = adj.keys
    colors  = Array.new(nodes.length()+1){ nil }
    odd_cycle = false

    # make sure we use all the connected components
    nodes.each do |n|
      # dont process an already explored connected component
      next if colors[n]
      colors[n] = 1
      q = [n]

      while !q.empty? do
        u = q.shift

        adj[u].each do |v|
          if colors[v].nil?
            colors[v] = 1 - colors[u]
            q << v
          elsif colors[v] == colors[u]
            # puts 'found odd cycle'
            odd_cycle = true
            # early exit for performance reasons
            return false
          end
        end
      end
    end
    # the graph is bipartite if there is no odd cycle
    !odd_cycle
  end
  module_function :bipartite

  # NOTE: in order to find the source of a graph we calculate the
  # sink of its reverse graph
  # NOTE: in order to calculate the reverse graph we simply swap the
  # edge pairs element order
  def detect_sccs(nodes, edges, adj)
    reverse_edges = edges.map{|(l,r)| [r,l] }
    reverse_adj = Graph.build_directed_adjacency_list(nodes, reverse_edges)
    postorder = Graph.dfs(reverse_adj)

    # in order to efficiently iterate over all the connected components we
    # iteratively explore the nodes in reverse postorder of the reverse Graph
    vertices = postorder.sort{|(k, v), (k2, v2)| v <=> v2 }.map(&:first).reverse


    # === house keeping ===
    previsit = nil # previsit hook is not needed
    visited = Hash.new{ false }
    postvisit = nil
    ccids   = Hash.new{ nil }
    cc = 1

    vertices.each do |v|
      next if visited[v]

      previsit = lambda { |v| ccids[v] = cc }

      Graph.explore(v, adj, visited, previsit, postvisit)

      cc +=1
    end
    return ccids
  end
  module_function :detect_sccs

  def reachable(cc, u, v)
    return false unless cc[u]
    return false unless cc[v]
    return cc[u] == cc[v]
  end
  module_function :reachable
end

module Graph
  module MST
    def from_points(points)
      edges   = Array.new { [] }
      weights = Array.new { [] }
      permutations = []

      points.permutation(2).each do |(i,x1,y1),(j,x2,y2)|
        weight = Math.sqrt( ((x1 - x2 ) ** 2) + ((y1 - y2) ** 2) )
        weights[i] ||= []
        weights[i][j] = weight

        puts "#{i}, #{x1}, #{x2} / #{j}, #{y1}, #{y2}" if weight.zero?

        permutations << [[x1,x2],[y1,y2]]

        edges << [i, j]
      end
      [edges, weights, permutations]
    end
    module_function :from_points

    def prim(adj, weights)
      cost = Array.new(adj.keys.length() + 1){ Float::INFINITY }
      prev = Array.new(adj.keys.length() + 1){ nil }
      nodes = adj.keys

      s = nodes.first
      cost[s] = 0

      q = HashQueue.new(cost)

      while !q.empty? do
        u = q.extract_min

        adj[u].each do |v|
          if q.include?(v) && cost[v] > weights[u][v]
            cost[v] = weights[u][v]
            prev[v] = u
            q.change_priority(v, cost[v])
          end
        end
      end
      cost.shift
      cost
    end
    module_function :prim

    def prim_sum(adj, weights)
      prim(adj, weights).reduce(&:+)
    end
    module_function :prim_sum

    def kruskal(adj, edges, weights)
      set = DisjointSet.new
      adj.keys.each do |v|
        set.makeSet(v)
      end

      result = Set.new

      edges2 = edges.sort do |(x1,y1),(x2,y2)|
        # puts "#{weights[x1][y1]} <=> #{weights[x2][y2]}"
        weights[x1][y1] <=> weights[x2][y2]
      end

      edges2.each do |u,v|
        # puts "edges: [#{u}, #{v}], weight: #{weights[u][v]}"
        if set.find(u) != set.find(v)
          # puts "updating with u: #{u} and v: #{v}"
          result << [u,v]
          set.union(u,v)
        end
      end
      edges3 = result.sort do |(x1,y1),(x2,y2)|
        weights[x1][y1] <=> weights[x2][y2]
      end.reverse

      edges3.map do |u,v|
        weights[u][v]
      end
    end
    module_function :kruskal

    def kruskal_sum(adj, edges, weights)
      kruskal(adj, edges, weights).reduce(0, &:+)
    end
    module_function :kruskal_sum

    def cluster(adj, edges, weights, k)
      costs = kruskal(adj, edges, weights)
      costs[k-2]
    end
    module_function :cluster
  end
end

def read_edges(n, unique: false)
  edges = Array.new { [] }
  weights = []
  n.times do
    u,v,w = gets.chomp.split.map(&:to_i)

    # if we can have multiple edges between two points
    # we can skip all but the lowest value for minimization problems
    if (!unique) && weights[u] && weights[u][v] && weights[u][v] < w
      # puts "WARNING: #{weights[u][v]} is already smaller than #{w}"
      next
    end
    edges << [u,v]
    weights[u] ||= []
    weights[u][v] = w

    edges << [v,u]
    weights[v] ||= []
    weights[v][u] = w
  end

  [edges, weights]
end

def solve_assignment
  n, m = gets.chomp.split.map(&:to_i)

  # points  = []

  nodes = (1..(n)).to_a
  edges, weights = read_edges(m)

  # 1.upto(n) do |i|
  #   x, y = gets.chomp.split.map(&:to_i)
  #   edges << [i, x, y]
  # end
  # edges, weights, permutations = Graph::MST.from_points(points)
  adj = Graph.build_undirected_adjacency_list(nodes, edges)

  # result = Graph::MST.prim(adj,weights)
  result = Graph::MST.prim_sum(adj, weights)
  puts result.to_s
end

solve_assignment
