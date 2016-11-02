
n  = gets.strip.to_i
arr = gets.strip.split.map(&:to_i)

carry, loaves = arr.inject([0,0]) do |(carry, loaves), cur| 
  [(carry + cur) % 2, loaves + 2 * carry]
end

if carry.zero?
  puts loaves
else
  puts "NO"
end
