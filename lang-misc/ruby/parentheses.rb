require 'pp'
=begin
Example expression: expr = '5 - 8 + 7 * 4 - 8 + 9'
Maximum value: 200

Max matrix
[[5, -3, 4, 25, 65, 200],
 [0, 8, 15, 60, 52, 75],
 [0, 0, 7, 28, 20, 35],
 [0, 0, 0, 4, -4, 5],
 [0, 0, 0, 0, 8, 17],
 [0, 0, 0, 0, 0, 9]]

Min matrix
[[5, -3, -10, -55, -63, -94],
 [0, 8, 15, 36, -60, -195],
 [0, 0, 7, 28, -28, -91],
 [0, 0, 0, 4, -4, -13],
 [0, 0, 0, 0, 8, 17],
 [0, 0, 0, 0, 0, 9]]
200
=end

def parentheses(expr)
  digits = expr.split('').select{|i| i =~ /\A[0-9]+\z/ }.map(&:to_i)
  ops    = expr.split('').select{|i| i =~ /\A[-+*]/ }
  n = digits.length
  mins = Array.new(n) { Array.new(n,0) }
  maxs = Array.new(n) { Array.new(n,0) }

  # set the diagonale to the initial expression's values
  0.upto(n -1).each do |i|
    mins[i][i] = digits[i]
    maxs[i][i] = digits[i]
  end

  1.upto(n-1).each do |s|
    0.upto(n -s -1).each do |i|
      j = i + s
      mins[i][j], maxs[i][j] = minAndMax(i,j, mins, maxs, ops)
    end
  end
  maxs[0][n-1]
end

def minAndMax(i,j, mins, maxs, ops)
  min = Float::INFINITY
  max =  -1.0 / 0 # negative infinity
  i.upto(j -1).each do |k|
    a = eval "#{maxs[i][k]} #{ops[k]} #{maxs[k+1][j]}"
    b = eval "#{maxs[i][k]} #{ops[k]} #{mins[k+1][j]}"
    c = eval "#{mins[i][k]} #{ops[k]} #{maxs[k+1][j]}"
    d = eval "#{mins[i][k]} #{ops[k]} #{maxs[k+1][j]}"
    min = [a,b,c,d,min].min
    max = [a,b,c,d,max].max
  end
  [min,max]
end

# expr = '5-8+7*4-8+9'
expr = gets.chomp
puts parentheses(expr)
