
n = gets.chomp.to_i

output = (1..n).each_with_object('') do |i,str|
  padding = n -i
  str << " "*padding + '#'*i + "\n"
end

puts output
