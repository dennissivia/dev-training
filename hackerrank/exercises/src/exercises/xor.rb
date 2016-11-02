
n, m = gets.chomp.split.map(&:to_i)
prev  = gets.chomp.split.map(&:to_i)

(1...m).each do |i|
  prev = (prev + [prev.first]).each_cons(2).map do |a,b|
    # puts "#{a} xor #{b}"
    a ^ b
  end
end
  puts prev.inspect
