require 'pry'
require './lib/linked_list'
require './lib/node'
require './lib/beat_box'

RSpec.describe BeatBox do
  before(:all) do
    @bb = BeatBox.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@bb).to be_instance_of(BeatBox)
    end
    
    it 'contains a LinkedList by default' do
      expect(@bb.list).to be_instance_of(LinkedList)
    end

    it 'can access data and methods used by LinkedList' do
      expect(@bb.list.head).to be_nil
      @bb.append("beep boop bop")
      expect(@bb.list.to_string).to eq("beep boop bop")
      @bb.append("boop boop bop")
      expect(@bb.count).to eq(6)
    end
  end
  
  xdescribe '.play' do
    it 'plays a sound based on the LinkedList' do
      @bb.append("beep beep boop bop boop bop bop")
    end
  end
end