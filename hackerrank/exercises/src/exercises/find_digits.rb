

t = gets.chomp.to_i
t.times do
  str = gets.chomp
  n = str.to_i
  digits = str.split('').map(&:to_i).reject(&:zero?)

  result = digits.inject(0) do |memo, x|
    memo = memo.succ if (n % x).zero?
    memo
  end
  puts result
end
