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
    else 
      current_node = @head
      new_node = Node.new(sound)
      new_node.next = current_node
      @head = new_node
    end
  end

  def insert(*sound)
    elements = sound
    nums = elements.select { |num| num.is_a? Integer}
    sounds = elements.select { |num| num.is_a? String}
    sounds.each do |sort|
      i = 0
      position = nums.shift 
      current_node = @head
      new_node = Node.new(sort)
      if position == 0
        old_node = @head
        @head = new_node
        @head.next = old_node  
      else
        until position == i
          old_node = current_node
          current_node = current_node.next 
          i += 1
        end
        current_node = old_node
        new_node.next = current_node.next
        current_node.next = new_node
      end
    end
  end

  def find(where, what)
    i = 0
    current_node = @head
      until i == where
        base = current_node
        current_node = current_node.next
        binding.pry
        i += 1
      end 
      base = current_node
      sounds = ''
    what.times do
      
      sounds = sounds + ' ' + base.data
      binding.pry
      base = base.next
    end
    sounds.strip
  end



end