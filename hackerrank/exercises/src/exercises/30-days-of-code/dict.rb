
n = gets.strip.to_i

data = (1..n).each_with_object({}) do |_,memo| 
  k, v = gets.strip.split
  memo[k] = v.to_i
end

n.times do
  q = gets.strip
  value = data[q]
  if value
    puts "#{q}=#{value}"
  else
    puts "Not found"
  end
end
