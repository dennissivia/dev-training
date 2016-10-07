
n = gets.strip.to_i
cur_count = 0
max = 0

n.to_s(2).split('').each do |i| 
  x = i.to_i

  if x == 1
    cur_count += 1
    max = cur_count if cur_count > max
  else
    cur_count = 0
  end
end

puts max
