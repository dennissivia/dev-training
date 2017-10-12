
def sum(coll)
  coll.reduce(&:+)
end

n = gets.chomp.to_i
matrix = (1..n).map do |i|
  gets.chomp.split(' ').map(&:to_i)
end

primary = (0..n-1).map do |i|
  matrix[i][i]
end

secondary = (0..n-1).map do |i|
  j = n -1 -i
  matrix[i][j]
end

puts (sum(primary) - sum(secondary)).abs

