module Graph
  # convert a array of edges ( int paris ) into
  # a hash with the vertex being the key and a list
  # of neighbours being the value
  def build_undirected_adjacency_list(nodes, edges)
    adj = {}
    # make sure all nodes without a edge given are properly
    # initialized with an empty array of neighbors
    nodes.each do |v|
      adj[v] = []
    end

    edges.each do |(x, y)|
      # in case of undirected graphs we add a neighbor
      # in both directions
      # We use the unless condition to make sure every
      # value is inserted only once
      adj[x] << y unless adj[x].include?(y)
      adj[y] << x unless adj[y].include?(x)
    end

    adj
  end
  module_function :build_undirected_adjacency_list

  def bfs(adj, s)
    len = adj.keys.length
    dist = Array.new(len + 1) { Float::INFINITY }

    dist[s] = 0
    q = [s]

    until q.empty?
      u = q.shift
      adj[u].each do |v|
        # does this already imply visited?
        if dist[v] == Float::INFINITY
          q <<  v
          dist[v] = dist[u] + 1
        end
      end
    end
    dist.shift
    dist
  end
  module_function :bfs

  def distance(adj, u, v)
    # The assignment states the u /= v
    # return 0 if u == v
    return -1 unless adj.key?(u)
    return -1 unless adj.key?(v)

    dists = Graph.bfs(adj, u)
    result = dists[v]

    result.nil? || result == Float::INFINITY ? -1 : result
  end
  module_function :distance

  def distances(adj, s)
    return -1 unless adj.key?(s)

    Graph.bfs(adj, s)
  end
  module_function :distances
end

def solve_assignment
  q = gets.chomp.to_i
  q.times do
    n, m = gets.chomp.split.map(&:to_i)
    edges = Array.new(m)

    m.times do |i|
      pair = gets.chomp.split.map(&:to_i)
      edges[i] = pair
    end

    s = gets.chomp.to_i

    nodes = (1..n).to_a
    adj   = Graph.build_undirected_adjacency_list(nodes, edges)
    dists = Graph.distances(adj, s)
    dists = dists.reject(&:zero?).map { |x| x == Float::INFINITY ? -1 : (6 * x) }

    puts dists.inspect
  end
end

solve_assignment
