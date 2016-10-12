class Node

    attr_accessor :data,:next

  def initialize data
        @data = data
        @next = nil
    end
end

class Solution
  def insert(head,value)
    new_node = Node.new(value)
    return new_node unless head

    cur = head
    while(cur.next) do
      cur = cur.next
    end
    cur.next = Node.new(value)
    head
  end

  def display(head)
       current = head
       while current
          print current.data," "
          current = current.next
       end
   end
end

mylist= Solution.new
head=nil
T=gets.to_i
for i in 1..T
    data=gets.to_i
    head=mylist.insert(head,data)
end
mylist.display(head)
