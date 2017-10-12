n, k = gets.chomp.split(' ').map(&:to_i)
list = gets.chomp.split(' ').map(&:to_i)

pairs = []
0.upto(n-1).each do |i|
  (i+1).upto(n-1).each do |j|
    puts "checking #{list[i]} + #{list[j]} against #{k}"
    if((list[i] + list[j]) % k).zero?
      puts 'match'
      pairs << [i, j]
    end
  end
end
puts pairs.count
