
def left_right_sums_equal?(arr)
  return true if arr.length == 1
  n   = arr.length
  total = arr.reduce(:+)

  lsum = 0
  rsum = total - arr[0]

  1.upto(n - 1).each do |i|
    lsum += arr[i - 1]
    rsum -= arr[i]
    # puts "idx #{i}/#{n} left #{lsum} and right #{rsum}"
    return true if lsum == rsum
  end

  false
end

q = gets.chomp.to_i
q.times do
  _n  = gets.chomp.to_i
  arr = gets.chomp.split.map(&:to_i)

  result = left_right_sums_equal?(arr)
  puts result == true ? 'YES' : 'NO'
end
