def distance(a, b)
  a, b = a.downcase, b.downcase
  costs = Array(0..b.length)

  (1..a.length).each do |i|
    # puts costs.inspect
    costs[0] = i
    nw = i - 1
    (1..b.length).each do |j|
      insert = costs[j] + 1 # insertion
      delete = costs[j-1] + 1 # deletion
      maybe_match = a[i-1] == b[j-1] ? nw : nw + 1 # match / mismatch

      # unfolded version of:
      # costs[j], nw = [costs[j] + 1, costs[j-1] + 1, a[i-1] == b[j-1] ? nw : nw + 1].min, costs[j]
      nw = costs[j]
      costs[j] = [insert,delete,maybe_match].min
    end
  end
  costs[b.length]
end
a = gets.chomp
b = gets.chomp
puts distance(a,b)
