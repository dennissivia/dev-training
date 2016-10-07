
_n = gets.strip.to_i
socks = gets.strip.split.map(&:to_i)
grouped = socks.group_by(&:itself)
pairs = grouped.map do |k,v| 
  v.length / 2
end

puts pairs.reduce(&:+)
