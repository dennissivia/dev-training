class Node
  attr_reader :id, :weight
  include Comparable

  def initialize(id:, weight:)
    @id = id
    @weight = weight
  end

  def <=>(other)
    weight <=> other.weight
  end

  def add_weight(w)
    set_weight(weight + w)
  end

  def set_weight(w)
    @weight = w
  end

  def plus_weight(w)
    @weight + w
  end

  def to_s
    "#<Node #{id}/#{weight}>"
  end

  def to_i
    id
  end

  def inspect
    to_s
  end
end

class BinaryMinHeap
=begin
  Example usage
  # _ = gets.chomp.to_i
  # arr = gets.chomp.split.map(&:to_i)
  # # puts BinaryMinHeap.heapSort(arr).join(" ")
  # heap = BinaryMinHeap.fromArray(arr)
  # heap.print_swaps
=end
  attr_reader :swaps
  def initialize(maxSize, input_data = [])
    @data = [0] + input_data
    @size = @data.size() -1
    @maxSize = maxSize +1
    @swaps = []
    init_positions!
  end

  private

  def init_positions!
    # in case the input data is not ordered by id
    # @positions = input_data.each_with_object({}).with_index do |(item, res), idx|
    #   res[item.to_i] = idx+1
    # end
    @positions = (1..@size).each_with_object({}) do |i, res|
      res[i] = i
    end
  end

  public

  def self.fromArray(arr)
    heap = new(arr.length, arr.dup)
    (arr.length()/2 ).downto(1).each do |i|
      heap.siftDown(i)
    end
    heap
  end

  def data(i = nil)
    if i.nil?
      @data[1,@size]
    else
      @data[i]
    end
  end

  def empty?
    @size.zero?
  end

  def extractMin
    result = @data[1]
    @data[1] = @data[@size]
    @positions[@data[@size].to_i] = 1

    @size -= 1
    @positions.delete(result.to_i)
    @data.delete_at(@size+1)

    siftDown(1)
    result.id
  end

  # p: priority or just the value of the node
  def insert(p)
    raise "No remaining space" if @size == @maxSize
    @size += 1
    @data[@size] = p
    siftUp(@size)
  end

  def remove(i)
    @data[i] = Float::INFINITY
    siftUp(i)
    extractMin
  end

  def changePriority(id, p)
      # i = data.find_index{ |n| n.id == id }
    # idx = i+1

    idx = @positions[id]

    # puts "changing priority of index #{i} in data #{@data[idx]} to #{p}"
    oldp = @data[idx].weight
    @data[idx].set_weight(p)
    if(p > oldp)
      siftDown(idx)
    else
      siftUp(idx)
    end
  end

  # int devision to automatically floor the value
  def parent(i)
    i/2
  end

  def leftChild(i)
    2*i
  end

  def rightChild(i)
    2*i +1
  end

  def siftUp(i)
    # while we are not the first element and
    # the parent value is smaller than our value
    while(i>1 && @data[parent(i)] > @data[i] ) do
      swap(parent(i), i)
      i = parent(i)
    end
  end

  def siftDown(i)
    minIndex = i
    l = leftChild(i)
    if l <= @size && @data[l] < @data[minIndex]
      minIndex = l
    end

    r = rightChild(i)
    if r <= @size && @data[r] < @data[minIndex]
      minIndex = r
    end

    if i != minIndex
      swap(i, minIndex)
      siftDown(minIndex)
    end
  end

  def swap(i,j)
    # enable for tracing all swaps
    @swaps << [ i -1 , j -1 ]

    #storing the position reduces lookup time
    # when changing priority
    @positions[@data[i].to_i] = j
    @positions[@data[j].to_i] = i

    @data[i], @data[j] = @data[j], @data[i]
  end

  def print_swaps
    puts @swaps.length
    @swaps.each do |(l,r)|
      puts "#{l} #{r}"
    end
  end

  def self.heapSort(arr)
    heap = fromArray(arr)
    result = (1..arr.length).map do |i|
      heap.extractMin
    end
  end
end

# Slow and simplistic priority queue via hash table
# simulate 1-indexed array via hash
# use for exploration/prototyping only
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

  def changePriority(i, val)
    # @data[i] = val
    @data[i].set_weight(val)
  end

  def extractMin
    index, min = @data.min{|(k1,v1),(k2,v2)| v1 <=> v2}
    @data.delete(index)
    index
  end
end

module Graph
  def build_adjacency_list(nodes, edges, directed: false)
    adj = {}
    # we need each key to be initialized at the end
    nodes.each do |v|
      adj[v] = []
    end

    edges.each do |(x,y)|
      adj[x] << y # unless adj[x].include?(y)
      unless directed
        adj[y] << x # unless adj[y].include?(x)
      end
    end

    adj
  end
  module_function :build_adjacency_list

  def build_directed_adjacency_list(nodes, edges)
    build_adjacency_list(nodes, edges, directed: true)
  end
  module_function :build_directed_adjacency_list

  def build_undirected_adjacency_list(nodes, edges)
    build_adjacency_list(nodes, edges, directed: false)
  end
  module_function :build_undirected_adjacency_list

  def dijkstra(adj, weights, s, t = nil)
    dist = Array.new(adj.keys.length+1){ Float::INFINITY }
    prev = Array.new(adj.keys.length+1){ nil }
    visited = Hash.new{false}

    dist[s] = 0
    dist.map!.with_index{ |v, i| Node.new(id: i, weight: v) }
    q = BinaryMinHeap.fromArray(dist[1,dist.length])
    # q = HashQueue.new(dist)

    while !q.empty? do
      u = q.extractMin

      if visited[u.to_i]
        # puts "skipped node #{u.to_i}"
        next
      end
      visited[u.to_i] = true

      adj[u].each do |v|
        if dist[v].weight > dist[u].weight + weights[u][v]
          # puts "updating dist #{dist[v]} to #{dist[u]} + weight #{weights[u][v]}"
          dist[v].set_weight(dist[u].weight + weights[u][v])
          prev[v] = u
          q.changePriority(v, dist[v].weight)
        end
      end
    end
    if t
      dist[t]
    else
      dist
    end
  end
  module_function :dijkstra

  def dijkstra_multi_query(queries, adj, weights)
    distance_map = {}
    output = []
    queries.map do |(s,t)|
      if distance_map.has_key?(s)
         distance_map[s][t]
      else
        dists = Graph.dijkstra(adj, weights, s, nil)
        distance_map[s] = dists
        dists[t]
      end
    end
  end
  module_function :dijkstra_multi_query
end

def add_edge(edges, weights, u, v, w)
  if weights[u] && weights[u][v]
    # just overwrite the previous value
    weights[u][v] = w
  else
    # define the edge and weight
    edges << [u,v]
    weights[u] ||= []
    weights[u][v] = w
  end
end

# is INFINITY really sufficient in all cases?
def weight_for(weights, u, v)
  if weights[u] && weights[u][v]
    weights[u][v]
  else
    Float::INFINITY
  end
end

def lowest?(weights, u, v, w)
  weight_for(weights, u, v) < w
end

def read_edges(n, use_lowest: true, directed: false)
  edges = Array.new { [] }
  weights = []
  n.times do
    u,v,w = gets.chomp.split.map(&:to_i)

    if directed
      triples = [[u, v, w]]
    else
      triples = [[u, v, w], [v, u, w]]
    end

    triples.each do |(u, v, w)|
      # given use_lowest: we want to skip all but the
      # lowest the lowest-weight connection between a given
      # pair of nodes
      next if (use_lowest) && lowest?(weights, u, v, w)

      add_edge(edges, weights, u, v, w)
    end
  end

  [edges, weights]
end

def print_distances(d, delim: " ")
  puts d.map{ |x| x.weight == Float::INFINITY ? -1 : x.weight}.join(delim)
end

#=============================
# END of general solution
#=============================

def process_step
  n, m = gets.chomp.split.map(&:to_i)

  edges, weights = read_edges(m, use_lowest: true, directed: false)

  nodes = (1..n).to_a
  s = gets.chomp.to_i

  adj = Graph.build_adjacency_list(nodes, edges, directed: true)

  distances = Graph.dijkstra(adj, weights, s, nil)
  distances.delete_at(s)
  distances.shift

  print_distances(distances)
end

def process_assignment
  q = gets.chomp.to_i
  q.times do
    process_step
  end
end
process_assignment
