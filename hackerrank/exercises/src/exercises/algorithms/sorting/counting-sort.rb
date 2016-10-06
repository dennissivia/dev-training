def counting_sort2(arr)
  # hsh = arr.group_by(&:itself).inject(Hash.new{0}){ |memo, (k,v)| memo[k] = v.length; memo }

  hsh = arr.group_by(&:itself).inject(Hash.new{0}){ |memo, (k,v)| memo[k] = v.join(' '); memo }
  result = (0..100).to_a.map do |i|
    hsh[i].to_s
  end.reject{ |x| x == '0' }
  puts result.join(' ')
end
# counting_sort2(arr)

def counting_sort(arr, start = 0, stop = 100)
  return [] if start > stop
  counters = Array.new(stop - start) { 0 }

  arr.each do |i|
    counters[i] += 1
  end

  counters
end

def print_result(counters)
  output = counters.each_with_object([]).with_index do |(c, result), i|
    next if c.zero?
    result << ([i.to_s] * c).join(' ')
  end
  puts output.join(' ')
end

def solve(arr)
  counted = counting_sort(arr)
  print_result(counted)
end

_n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

solve(arr)
