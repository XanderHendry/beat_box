require 'pry'
require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  describe '#initialize' do  
    it 'exists' do
      list = LinkedList.new
      expect(list).to be_instance_of(LinkedList)
    end

    it 'has a head that defaults to nil' do
      list = LinkedList.new
      expect(list.head).to be_nil
    end

    it 'has a head that does not have to be nil' do
      list = LinkedList.new("Head")
      expect(list.head).to eq("Head")
    end
  
    it 'has a head whose value can be changed' do
      list = LinkedList.new
      expect(list.head).to be_nil
      list.head = "Head"
      expect(list.head).to eq("Head")
    end

    it 'has a head that can be a Node' do
      node = Node.new
      list = LinkedList.new(node)
      expect(list.head).to be_instance_of(Node)
    end
  end
  
  describe '.append' do
    it 'can re-assign the value of @head' do
      list = LinkedList.new
      expect(list.head).to be_nil
      list.append("beep")
      expect(list.head.data).to eq("beep")
    end

    it 'makes a Node using string passed as an argument' do
      list = LinkedList.new
      list.append("beep")
      expect(list.head).to be_instance_of(Node)
    end

    it 'can re-assign the value of @next' do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      expect(list.head.next).to be_instance_of(Node)
    end

    it 'moves to the next node if @next is not nil' do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      list.append("bop")
      expect(list.head.next.next).to be_instance_of(Node)
    end
  end 

  describe '.count' do
    it 'returns 0 if the list is empty' do
      list = LinkedList.new
      expect(list.count).to eq(0)
    end

    it 'will return 1 if the list only has a head' do
      list = LinkedList.new
      list.append("beep")
      expect(list.count).to eq(1)
    end

    it "will return 2 if a node follows the head" do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      expect(list.count).to eq(2)
    end

    it 'will count any number of nodes' do
      list = LinkedList.new
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

  describe '.to_string' do
    it 'returns an empty string, if @head is nil' do
      list = LinkedList.new
      expect(list.to_string).to eq("")
    end

    it 'returns the @data value of any node stored in @head' do
      list = LinkedList.new
      list.append("beep")
      expect(list.to_string).to eq("beep")
    end

    it 'returns the @data value of multiple nodes in a single string' do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      expect(list.to_string).to eq("beep boop")
    end
  end

  describe '.prepend' do
    it 'will add nodes to the beginning of the list.' do
      list = LinkedList.new
      list.append("boop")
      list.prepend("beep")
      expect(list.head).to be_instance_of(Node)
      expect(list.head.data).to eq("beep")
    end

    it 'moves the previous Head to the next spot on the list' do
      list = LinkedList.new
      list.prepend("bop")
      list.prepend("boop")
      list.prepend("beep")
      expect(list.head.next).to be_instance_of(Node)
      expect(list.to_string).to eq("beep boop bop")
    end
  end

  describe '.insert' do
    it 'will insert an element at a given position in the list.' do
      list = LinkedList.new
      list.prepend("beep")
      list.append("bop")
      list.insert(1, "boop")
      expect(list.to_string).to eq("beep boop bop")
    end
  end

  describe '.find' do
    it 'takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return.' do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      list.append("bop")
      list.append("beep")
      expect(list.find(1, 3)).to eq("boop bop beep")
    end
  end

  describe '.includes?' do
    it 'gives back true or false whether the supplied value is in the list' do
      list = LinkedList.new
      list.append("beep")
      expect(list.includes?("beep")).to eq(true)
      expect(list.includes?("boop")).to eq(false)
    end
  end

  describe '.pop' do
    it 'removes the last element from the list and returns it.' do
      list = LinkedList.new
      list.append("beep")
      list.append("boop")
      list.append("bop")
      expect(list.pop.data).to eq("bop")
      expect(list.to_string).to eq("beep boop")
    end
  end
end