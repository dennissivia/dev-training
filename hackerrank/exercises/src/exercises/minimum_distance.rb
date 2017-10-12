
def minimum_distance(coll)
  min = Float::INFINITY
  return min if coll.length < 2

  coll.each_cons(2) do |x,y|
    if (x -y).abs < min
      min = (x -y).abs
    end
  end
  min
end

def solve(input)
  nums = input.split(' ').map(&:to_i)
  pairs = nums.map.with_index do |v,i|
    [v,i]
  end
  grouped = pairs.group_by{ |val,i| val}.each_with_object({}){|(key,coll),memo| memo[key] = coll.map(&:last).flatten.sort }

  result = grouped.map { |k,coll| minimum_distance(coll) }.min
  result == Float::INFINITY ? -1 : result
end

# input = '7 1 3 4 1 7'
gets.chomp
input = gets.chomp

puts solve(input)
