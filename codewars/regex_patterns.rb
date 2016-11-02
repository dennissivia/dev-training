

n = gets.strip.to_i

stream = n.times.lazy.map do |_x| 
  gets.strip.split
end
result = stream.select{ |name, email| email =~ /@gmail.com/ }.map(&:first)
puts result.sort




[]
