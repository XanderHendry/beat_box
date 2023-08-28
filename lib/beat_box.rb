class BeatBox
  attr_accessor :list, :rate, :voice
  def initialize
    @list = LinkedList.new
  end

  def append(sounds)
    words = sounds.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop", "tee", "dee", "deep", "la", "na"]
    # binding.pry
    words.each do |sound|
      if filter.include?(sound)
        @list.append(sound)
        # binding.pry
      end
    end
  end

  def prepend(sounds)
    words = sounds.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop", "tee", "dee", "deep", "la", "na"]
    # binding.pry
    words.each do |sound|
      if filter.include?(sound) 
        @list.prepend(sound)
        # binding.pry
      end
    end
  end

  def count
    @list.count
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