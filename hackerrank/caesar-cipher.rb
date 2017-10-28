#!/bin/ruby

n = gets.strip.to_i
s = gets.strip
k = gets.strip.to_i
def caesar_encode(s,k)
  s.split('').map(&:ord).map do |num|
    if (65..90).cover?(num)
      n = (((num - 65) + k) % 26) + 65
      n.chr
    elsif (97..122).cover?(num)
      n = (((num - 97) + k) % 26) + 97
      n.chr
    else
      num.chr
    end
  end.join('')
end
puts caesar_encode(s,k)
