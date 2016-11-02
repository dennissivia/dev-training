
n, m = gets.strip.split.map(&:to_i)

adj = Hash.new{ 0 }
m.times do 
  l, r = gets.strip.split.map(&:to_i)
  adj[r] += 1
end 

even_degree_nodes = adj.select do |_, arr| 
  arr.even?
end
puts even_degree_nodes.count


