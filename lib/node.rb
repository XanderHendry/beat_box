class Node
  attr_reader :data, :next
  attr_writer :data, :next
  def initialize (sound = nil)
    @data = sound
    @next = nil
  end
end