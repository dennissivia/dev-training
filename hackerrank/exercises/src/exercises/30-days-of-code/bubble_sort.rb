
class Swapper
  attr_reader :swaps

  def initialize(arr)
    @arr = arr
    @swaps = 0
  end

  def swap(i, j)
    @swaps += 1
    @arr[i], @arr[j] = @arr[j], @arr[i]
  end
end

n = gets.strip.to_i
arr = gets.strip.split.map(&:to_i)
swapper = Swapper.new(arr)

(0...n.pred).each do |_|
  (0...n.pred).each do |i|
    if arr[i] > arr[i.succ]
      swapper.swap(i, i.succ)
    end
  end
end

puts "Array is sorted in #{swapper.swaps} swaps."
puts "First Element: #{arr.first}"
puts "Last Element: #{arr.last}"
