require './lib/linked_list'
require './lib/node'

RSpec.describe Node do
  describe '#initialize' do
    it 'exists' do
      node = Node.new
      expect(node).to be_instance_of(Node)
    end

    it 'passes a string as an argument' do
      node = Node.new("beep")
      expect(node).to be_instance_of(Node)
    end

    it 'stores the argument as an attribute' do
      node = Node.new("beep") 
      expect(node.data).to eq("beep")
    end

    it 'has an attribute called @next_node that defaults to nil' do
      node = Node.new("beep")
      expect(node.next_node).to be_nil
    end
  end

end