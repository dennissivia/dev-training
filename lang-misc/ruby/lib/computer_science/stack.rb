module ComputerScience
  class Stack
    def initialize
      @stack = []
      @size = 0
    end

    def push(elem)
      @stack[@size] =  elem
      @size += 1
      elem
    end

    def pop 
      # we could also introduce a counter class
      # that simply ignores decrements
      return nil if empty?

      elem = @stack[@size -1]
      @size -= 1
      elem
    end 

    def empty?
      @size.zero?
    end

    def size
      @size
    end
    def inspect
      @stack.inspect
    end
  end
end
