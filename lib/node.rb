class Node
  attr_reader :data, :next_node
  attr_writer :next_node
  def initialize (sound = nil)
    @data = sound
    @next_node = nil
  end
end