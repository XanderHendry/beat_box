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

  def insert(position, string)
      new_node = Node.new(string)
      current_node = @head
      base = current_node
      position.times do
        if current_node.next.nil?
          break
        end
         base = current_node
         current_node = current_node.next
      end
      new_node.next = current_node
      base.next = new_node
  end




  # def insert(*elements)
  #   elements = elements.flatten
  #   binding.pry
  #   nums = elements.select { |element| element.is_a? Integer}
  #   sounds = elements.select { |element| element.is_a? String}
  #   sounds.each do |sound|
  #     i = 0
  #     position = nums.shift 
  #     current_node = @head
  #     new_node = Node.new(sound)
  #     if position == 0
  #       old_node = @head
  #       @head = new_node
  #       @head.next = old_node  
  #     else
  #       until position == i
  #         old_node = current_node
  #         current_node = current_node.next 
  #         i += 1
  #       end
  #       current_node = old_node
  #       new_node.next = current_node.next
  #       current_node.next = new_node
  #     end
  #   end
  # end

  def find(where, what)
    i = 0
    current_node = @head
      until i == where
        base = current_node
        current_node = current_node.next
        i += 1
      end 
      base = current_node
      sounds = ''
    what.times do      
      sounds = sounds + ' ' + base.data
      base = base.next
    end
    sounds.strip
  end

  def includes?(sound)
    current_node = @head
    if current_node.data != sound
      until current_node.data == sound || current_node.next == nil
        current_node = current_node.next
      end
      current_node.data == sound
    else
    current_node.data == sound
    end
  end
    
  def pop
    current_node = @head
    if !current_node.nil?
      while !current_node.next.nil?
        base = current_node
        current_node = current_node.next
      end
      base.next = nil
      return current_node
    end
  end

end