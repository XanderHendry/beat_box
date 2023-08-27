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
      binding.pry
    end
    binding.pry
  end

  def count
    @list.count
  end
end