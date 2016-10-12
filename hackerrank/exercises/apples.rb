
s,t     = gets.strip.split.map(&:to_i)
house   = (s..t)
a,b     = gets.strip.split.map(&:to_i)
_n,_m   = gets.strip.split.map(&:to_i)
apples  = gets.strip.split.map(&:to_i)
oranges = gets.strip.split.map(&:to_i)

as = apples.select  { |x| house.cover?(a + x) }
os = oranges.select { |x| house.cover?(b + x) }

puts as.length
puts os.length
