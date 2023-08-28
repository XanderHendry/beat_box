require 'pry'
require './lib/linked_list'
require './lib/node'
require './lib/beat_box'

RSpec.describe BeatBox do
  describe '#Initialize' do
    it 'exists' do
      bb = BeatBox.new
      expect(bb).to be_instance_of(BeatBox)
    end
    
    it 'contains a LinkedList by default' do
      bb = BeatBox.new
      expect(bb.list).to be_instance_of(LinkedList)
    end
  end
  describe '.append' do
    it 'will add multiple sounds at once' do
      bb.append("beep boop bop")
      expect(bb.list.to_string).to eq("beep boop bop")
    end
    
    it 'will only accept certain sounds.' do
      bb.append("beep boop coding boo bop is beep bee fun! boo bopbop")
      expect(bb.to_string).to eq('beep boop boo bop beep bee boo bopbop')
    end
  end
  
  describe '.count' do
    it 'will return the number of nodes contained in the list with .count' do
      bb = BeatBox.new
      expect(bb.list.head).to be_nil
      bb.append("beep boop bop boop boop bop")
      expect(bb.count).to eq(6)
    end
  end
  
  describe '.play' do
    
    it 'plays a sound based on the LinkedList' do
      bb = BeatBox.new
      bb.append("beep beep boop bop boop bop bop")
      expect(bb.list.to_string).to eq("beep beep boop bop boop bop bop")
      expect(bb.play).to eq(`say -r 200 -v Boing "beep beep boop bop boop bop bop"`)
    end
  end
end