
s = gets.strip
l = s.length
n = gets.strip.to_i
as = s.scan("a").count
times = (n / l)

c  = as * times
a = l * times
b = n - a
c2 = s[0,b].scan("a").count

puts c + c2
