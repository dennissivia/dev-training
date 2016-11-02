
t = gets.strip.to_i
t.times do
  n, k = gets.strip.split.map(&:to_i)

  max = 0
  (1..n).each do |i| 
    (i.succ..n).each do |j| 
      res = i & j
      next if res >= k
      next if res <= max
      max = res 
    end
  end
  puts max
end
