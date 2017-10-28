
n = readline.to_i

arr = Array.new(n) { readline.to_i }
k = readline.to_i
if arr.include?(k)
  puts "YES"
else
  puts "NO"
end
