arr = gets.strip
arr = arr.split(' ').map(&:to_i)

arr.sort!
len =  arr.length
puts "#{arr[1, len].reduce(&:+)} #{arr[0,len.pred].reduce(&:+)}"
