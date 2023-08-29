class BeatBox

  attr_reader :list
  attr_writer :list
  def initialize(string = nil)
    @list = LinkedList.new
    if !string.nil?
    sounds = string.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop"]
      sounds.each do |sound|
        if filter.include?(sound)
          @list.append(sound)
        end
      end
    end
  end


  def append(string)
    sounds = string.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop"]
    sounds.each do |sound|
      if filter.include?(sound)
        @list.append(sound)
      end
    end
  end

  def prepend(string)
    sounds = string.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop"]

    # binding.pry
    sounds.each do |sound|
      if filter.include?(sound) 
        @list.prepend(sound)
      end
    end
  end

  def insert(position, string)
    sounds = string.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop"]
    sounds.each do |sound|
      if filter.include?(sound) 
        @list.insert(position, sound)
      end
    end
  end

  def find(where, what)
    @list.find(where, what)
  end

  def count
    @list.count
  end
  
  def pop
    @list.pop
  end

  def includes?(sound)
    @list.includes?(sound)
  end

  def to_string
    @list.to_string
  end

  def play 
    beats = @list.to_string
    @rate = 500
    @voice = "Boing"
    `say -r = #{@rate} -v = #{@voice} #{beats}`
  end

  def reset_rate
    @rate = 500
    @rate
  end

  def reset_voice
    @voice = "Boing"
    @voice
  end
end  