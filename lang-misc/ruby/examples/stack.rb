require_relative '../lib/training.rb'
s = ComputerScience::Stack.new
s.push 1
s.push 20
puts "size: " + s.size.to_s
puts "empty: " + (s.empty?).to_s
puts "inspect" + s.inspect
puts s.pop
puts s.pop
puts "empty: " + (s.empty?).to_s
