#!/bin/ruby

def birthdayCakeCandles(n, arr)
  arr.sort.group_by(&:itself).map{|k,v| v.length}.last
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = birthdayCakeCandles(n, ar)
puts result;
