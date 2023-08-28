class BeatBox
  attr_reader :list
  attr_writer :list
  def initialize
    @list = LinkedList.new
  end

  def append(sounds)
    words = sounds.split(' ')
    filter = ["beep", "boop", "bop", "boo", "bee", "bopbop"]
    binding.pry
    words.each do |sound|
      if filter.include?(sound)
        @list.append(sound)
        binding.pry
      end
    end
  end

  def count
    @list.count
  end

  def play 
    beats = @list.to_string
    `say -r 200 -v Boing #{beats}`
  end
end  