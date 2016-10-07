

n = gets.strip.to_i
count = (0..n).inject(0) do |memo,x| 
  memo += 1 if n ^ x == n + x 
  memo
end
puts count
