class Linked_list
  attr_reader :head
  attr_writer :head
  def initialize(head = nil)
    @head = head
  end

  def append(sound)
   if self.head == nil
    @head = Node.new(sound)
   else
    current_node = @head
    new_node = Node.new(sound)
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = new_node
    end
  end
  
  def count
    index = 0
    current_node = @head
      while current_node != nil
        current_node = current_node.next
        index += 1
      end
      binding.pry
      return index
  end
end