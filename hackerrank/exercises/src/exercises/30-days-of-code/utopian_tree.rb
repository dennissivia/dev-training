
t = gets.strip.to_i
t.times do |i| 
  cycles = gets.strip.to_i
  spring_op  = lambda { |x| x * 2}
  summer_op  = lambda { |x| x + 1}
  ops = [summer_op, spring_op]

  result = (1..cycles).inject(1) do |height, cycle| 
    ops[cycle % 2].call(height) 
  end
  puts result
end
