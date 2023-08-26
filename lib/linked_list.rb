class LinkedList
  attr_reader :head
  attr_writer :head
  def initialize(head = nil)
    @head = head
  end

  def append(sound)
   if self.head.nil?
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
    return index
  end

  def to_string
    string = ''
    current_node = @head
      while !current_node.nil?
        string = string + ' ' + current_node.data
        current_node = current_node.next
      end
    string.strip
  end 

  def prepend(sound)
    if self.head.nil?
      @head = Node.new(sound)
      # binding.pry
    else 
      current_node = @head
      new_node = Node.new(sound)
      # binding.pry
      new_node.next = current_node
      @head = new_node
      # binding.pry
    end
  end

  def insert(*sound)
    elements = sound
    nums = elements.select { |num| num.is_a? Integer}
    sounds = elements.select { |num| num.is_a? String}
    sounds.each do |sort|
      i = 0
      position = nums.index(i) 
      current_node = @head
      new_node = Node.new(sort)
      binding.pry
      until position == i
        i += 1
        current_node = current_node.next
        binding.pry
      end
      old_node = current_node
      binding.pry
      current_node = new_node
      binding.pry
      current_node.next = old_node
      binding.pry
    end
  end
end