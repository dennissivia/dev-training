
n = gets.strip.to_i
result = (1..n).reduce(1,&:*)
puts result
