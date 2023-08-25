require 'pry'
require './lib/linked_list'
require './lib/node'

RSpec.describe Linked_list do
  describe '#inxitialize' do  
    it 'exists' do
      list = Linked_list.new
      expect(list).to be_instance_of(Linked_list)
    end

    it 'has a head that defaults to nil' do
      list = Linked_list.new
      expect(list.head).to be_nil
    end

    it 'has a head that does not have to be nil' do
      list = Linked_list.new("Head")
      expect(list.head).to eq("Head")
    end
  
    it 'has a head whose value can be changed' do
      list = Linked_list.new
      expect(list.head).to be_nil
      list.head = "Head"
      expect(list.head).to eq("Head")
    end

    it 'has a head that can be a Node' do
      node = Node.new
      list = Linked_list.new(node)
      expect(list.head).to be_instance_of(Node)
    end
  end
  
  describe '#append' do
    it 'can re-assign the value of @head' do
      list = Linked_list.new
      expect(list.head).to be_nil
      list.append("beep")
      expect(list.head.data).to eq("beep")
    end

    it 'makes a Node using string passed as an argument' do
      list = Linked_list.new
      list.append("beep")
      expect(list.head).to be_instance_of(Node)
    end

    it 'can re-assign the value of @next_node' do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      expect(list.head.next_node).to be_instance_of(Node)
    end

    it 'moves to the next node if @next_node is not nil' do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      list.append("bop")
      expect(list.head.next_node.next_node).to be_instance_of(Node)
    end

  end 
  
end