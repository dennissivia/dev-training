=begin
  # create pseudo coins per base value
  coins = ops.map {|op| send(op,operations[m-1]) }
  puts coins.inspect
  coins.each do |coin|

    # puts m.inspect
    # puts num
    # puts i

    if m >= coin
      # if our coin fits into the value we check if:
      # the current amount - the value of the amout +1 ( for adding this coin )
      # is smaller than the current amount of coins, thus minimizes the coins
      # if so, we apply this change and use this coin
      # change money calculation:
      # tmp = operations[m - coin] + 1

      if tmp < operations[m]
        puts
        transformations[m] ||= []
        transformations[m] = coin
        operations[m] = tmp
      end
    end
  end
end
=end

n = gets.chomp.to_i
# n = 32718
# 18
# n = 96234
# n = 5
operations = Array.new(n+1,0)
values = Array.new(n+1,0)

(1..(n)).each do |m|
  operations[m] = Float::INFINITY

  a = [operations[m/3]+1, values[m/3]*3]
  b = [operations[m/2]+1, values[m/2]*2]
  c = [operations[m-1]+1, values[m-1]+1]

  # define the best move
  min = [a.first, b.first, c.first].min

  #  is divisable by 3? *3 does not exeed m and is the num operations is minimized
  if (m%3).zero? && (min == a.first)
    operations[m] = a.first
    values[m] = values[m/3] * 3
  elsif (m%2).zero? && (min == b.first)
    operations[m] = b.first
    values[m] = values[m/2] * 2
  else
    operations[m] = c.first
    values[m] = values[m-1]+1
  end
  # puts values[0,m].inspect
end

def backtrack(init, items)
  values = []
  values.push(init)
  val = init
  i = (items.length() -1)
  while(i > 0) do
    a = (i%3).zero? ? items[i/3] : Float::INFINITY
    b = (i%2).zero? ? items[i/2] : Float::INFINITY
    c = items[i-1]
    min = [a,b,c].min

    if min == a
      i /= 3
      val /= 3
      values.push(val)
    elsif min == b
      i /= 2
      val /=2
      values.push(val)
    else
      i -= 1
      val -= 1
      values.push(val)
    end
    # require 'pry'
    # binding.pry
  end
  values.reverse[1,values.length] # ignore leading zero
end

result = operations.last() -1 # ignore leading zero
result2 = backtrack(n, operations)
# if result2.length() -1 == 19
#   puts "18"
# else
  puts result2.length() -1
# end

puts result2.join(" ")
