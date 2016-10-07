
_n, k = gets.strip.split.map(&:to_i)

clouds = gets.strip.split.map(&:to_i).map do |v| 
  if v.zero?
    1
  else
    3
  end
end

matches = clouds.each_slice(k).flat_map(&:first)
result =  matches.reduce(&:+)
puts (100 - result)
