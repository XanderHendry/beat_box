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
        binding.pry
      end
      current_node.next = new_node
    end
  end
  
   
    # sound = Node.new(string)
    # if @head == nil  
    #   @head = sound
    # elsif @head.next_node == nil
    #   @head.next_node = sound
    # else 
    #   @head.next_node.next_node = sound
    # end
  #end
end