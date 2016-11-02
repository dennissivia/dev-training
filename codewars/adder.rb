require 'pry'

class Adder
  def initialize(i)
    @value = i
  end
  
  def call(i)
    Adder.new(@value + i)
  end
  
  def to_int
    @value
  end
  
  def to_i
    @value
  end
end

def add(n)
  Adder.new(n)
end

puts add(1).inspect
binding.pry
puts (add(1) == 1)
puts (add(1).(2) == 3)
puts (add(1).(2).(3) == 6)
