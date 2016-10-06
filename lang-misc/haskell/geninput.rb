max = 10**5
f = File.open('input-qsort-random.txt', 'w')

f << max.to_s << "\n"
f << (1..max).map {|i| rand(i) }.join(' ') << "\n"
