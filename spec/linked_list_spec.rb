require 'pry'
require './lib/linked_list'
require './lib/node'

RSpec.describe Linked_list do
  describe '#inxitialize' do  
    xit 'exists' do
      list = Linked_list.new
      expect(list).to be_instance_of(Linked_list)
    end

    xit 'has a head that defaults to nil' do
      list = Linked_list.new
      expect(list.head).to be_nil
    end

    xit 'has a head that does not have to be nil' do
      list = Linked_list.new("Head")
      expect(list.head).to eq("Head")
    end
  
    xit 'has a head whose value can be changed' do
      list = Linked_list.new
      expect(list.head).to be_nil
      list.head = "Head"
      expect(list.head).to eq("Head")
    end

    xit 'has a head that can be a Node' do
      node = Node.new
      list = Linked_list.new(node)
      expect(list.head).to be_instance_of(Node)
    end
  end
  
  describe '#append' do
    xit 'can re-assign the value of @head' do
      list = Linked_list.new
      expect(list.head).to be_nil
      list.append("beep")
      expect(list.head.data).to eq("beep")
    end

    xit 'makes a Node using string passed as an argument' do
      list = Linked_list.new
      list.append("beep")
      expect(list.head).to be_instance_of(Node)
    end

    xit 'can re-assign the value of @next' do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      expect(list.head.next).to be_instance_of(Node)
    end

    xit 'moves to the next node if @next is not nil' do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      list.append("bop")
      expect(list.head.next.next).to be_instance_of(Node)
    end
  end 

  describe '#count' do
    it 'returns 0 if the list is empty' do
      list = Linked_list.new
      expect(list.count).to eq(0)
    end

    it 'will return 1 if the list only has a head' do
      list = Linked_list.new
      list.append("beep")
      expect(list.count).to eq(1)
    end

    it "will return 2 if a node follows the head" do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      expect(list.count).to eq(2)
    end

    it 'will count any number of nodes' do
      list = Linked_list.new
      expect(list.count).to eq(0)
      list.append("beep")
      expect(list.count).to eq(1)
      list.append("boop")
      expect(list.count).to eq(2)
      list.append("bop")
      expect(list.count).to eq(3)
      list.append("beep")
      expect(list.count).to eq(4)
    end
  end

  describe '#to_string' do
    xit 'returns an empty string, if @head is nil' do
      list = Linked_list.new
      expect(list.to_string).to eq("")
    end

    xit 'returns the @data value of any node stored in @head' do
      list = Linked_list.new
      list.append("beep")
      expect(list.to_string).to eq("beep")
    end

    xit 'returns the @data value of multiple nodes in a single string' do
      list = Linked_list.new
      list.append("beep")
      list.append("boop")
      expect(list.to_string). eq("beep boop")
    end
  end
end