n = gets.chomp.to_i
list = gets.chomp.split(" ").map(&:to_i)

cuts = 0
if list.length == 1
  x = list.first
  cuts += 2
  list = [x/3.0,x/3.0,x/3.0]
elsif list.length == 2
  min,max = list
  cuts += 1
  list = [min,max/2.0, max/2.0]
end

slist = list.sort
2.upto(list.length-1).each do |i|
  if slist[i-2]+ slist[i-1] <= slist[i]
    cuts+=1
  end
end

puts cuts

