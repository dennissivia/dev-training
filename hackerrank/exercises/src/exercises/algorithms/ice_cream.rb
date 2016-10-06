
def find_pair(arr, m)
  arr.each_with_index do |_v, i|
    arr.each_with_index do |_w, j|
      next if i == j
      if arr[i] + arr[j] == m
        return [i+1, j+1]
      end
    end
  end
  return []
end

q = gets.chomp.to_i
q.times do
  m   = gets.chomp.to_i
  _n  = gets.chomp.to_i
  arr = gets.chomp.split.map(&:to_i)
  result = find_pair(arr, m)
  puts result.join(' ')
end
