
class LinkedList
  class Node 
    attr_reader :next, :value
    def initialize(value:, next_ref:)
      @value = value
      @next  = next_ref
    end
  end

  def initialize
    @first = nil
  end

  def push(value)
    node = Node.new(value: value,next_ref: first)
    @first = node
  end

  def pop
    val = first.value
    @first = first.next
  end

  def empty?
    first.nil?
  end

private
  def first
    @first
  end
end
