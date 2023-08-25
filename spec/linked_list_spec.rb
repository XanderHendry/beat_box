require './lib/linked_list'
require './lib/node'

RSpec.describe Linked_list do
    it 'exists' do
      list = Linked_list.new
      expect(list).to be_instance_of(Linked_list)
    end

    it 'has a head that defaults to nil' do
      list = Linked_list.new
      expect(list.head).to eq(nil)
    end

    it 'has a head that does not have to be nil'
      list = Linked_list.new("Head")
      expect(list.head).to eq("Head")
    end

    it 'has a head whose value can be changed'
      list = Linked_list.new
      expect(list.head).to eq(nil)
      list.head = "Head"
      expect(list.head).to eq("Head")
    end

    xit 'has a head that can be a Node'
      node = Node.new
      list = Linked_list.new(node)
      expect(list.head).to be_instance_of(Node)
    end
end