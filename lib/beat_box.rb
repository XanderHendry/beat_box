class BeatBox
  attr_reader :list
  attr_writer :list
  def initialize
    @list = LinkedList.new
  end

  def append(sounds)
    words = sounds.split(' ')
    words.each do |sound|
            @list.append(sound)

    end
  end

  def count
    @list.count
  end

  def play 
    beats = @list.to_string
    `say -r 300 -v Boing #{beats}`
  end
end  