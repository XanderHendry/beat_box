class Linked_list
  attr_reader :head
  attr_writer :head
  def initialize(head = nil)
    @head = head
  end

  def append(string)
    sound = Node.new(string)
    if @head == nil  
      @head = sound
    elsif @head.next_node == nil
      @head.next_node = sound
    else 
      @head.next_node.next_node = sound
    end
  end
end