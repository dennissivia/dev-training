max = max_points = max_segments = ARGV[0].to_i || 10_000

f = File.open("input-segments-random-#{max}.txt", 'w')

#write first line
f << max.to_s << " " << max.to_s << "\n"

#write segments
(1..max).each do |i|
  l = rand(i)
  r = l + rand(i)
  f << l.to_s << " " << r.to_s << "\n"
end

# write points
f << (1..max).map {|i| rand(i) }.join(' ') << "\n"
