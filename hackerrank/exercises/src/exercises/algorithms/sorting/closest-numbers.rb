
_n = gets.chomp.to_i
nums = gets.chomp.split.map(&:to_i).sort

mins = [Float::INFINITY]
min  = mins.first

nums.each_cons(2).with_index do |(a,b), i|
  diff = b - a
  if diff < min
    mins = [[a, b]]
    min = diff
  elsif diff == min
    mins << [a, b]
  end
end
puts mins.flatten.join(' ')
