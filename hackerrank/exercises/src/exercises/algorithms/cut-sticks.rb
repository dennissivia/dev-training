

_n = gets
arr = gets.chomp.split.map(&:to_i)
arr.sort!

until arr.empty? do
  puts arr.length
  arr.delete(arr.min)
end
