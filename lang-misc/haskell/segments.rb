
num_segments, num_points = gets.chomp.split.map(&:to_i)

segments = (1..num_segments).map do
  a,b = gets.chomp.split.map(&:to_i)
  [a,b]
end.sort{|a,b| a.first <=> b.first }


1.upto(num_points) do
  point = gets(' ').to_i
  # segments.select{ |s| s.cover? point }.count
  accu = 0
  segments.each do |segment|
    next if segment.last < point
    break if segment.first > point
    accu+= 1 if segment.last >= point
  end
  print accu.to_s + ' '
end
puts
