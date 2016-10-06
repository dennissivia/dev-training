
def counting_sort3(queries)
  arr = Array.new(100) { 0 }
  queries.each do |i|
    arr[i] += 1
  end

  total = 0
  arr.map do |c|
    total += c
    total
  end
end

def solve1
  n = gets.chomp.to_i
  queries = n.times.to_a.map do
    gets.chomp.split.first.to_i
  end
  puts counting_sort3(queries).join(' ')
end

def solve2
  n = gets.chomp.to_i
  n2 = n/2
  arr = Array.new(n){ [] }

  n.times.to_a.map do |i|
    d, s = gets.chomp.split
    if i < n2
      arr[d.to_i] << '-'
    else
      arr[d.to_i] << s
    end
  end
  puts  arr.flatten.join(' ')

  # puts counting_sort4(queries).join(' ')
end

solve2
