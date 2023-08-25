class Linked_list
  attr_reader :head
  attr_writer :head
  def initialize(head = nil)
    @head = head
  end
end