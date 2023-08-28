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
    it 'will add sounds to the end of the list' do
      bb = BeatBox.new
      bb.append("beep")
      bb.append("boop")
      expect(bb.list.to_string).to eq("beep boop")
    end

    it 'will add multiple sounds at once' do
      bb = BeatBox.new
      bb.append("beep boop bop")
      expect(bb.list.to_string).to eq("beep boop bop")
    end
    
    it 'will only accept certain sounds.' do
      bb = BeatBox.new
      bb.append("beep boop coding boo bop is beep bee fun! boo bopbop")
      expect(bb.list.to_string).to eq('beep boop boo bop beep bee boo bopbop')
    end
  end
  
  describe '.prepend' do
    it 'will add sounds to the start of the list' do
      bb = BeatBox.new
      bb.append("boop")
      bb.prepend("beep")
      expect(bb.list.to_string).to eq("beep boop")
    end

    it 'will add multiple sounds at once' do
      bb = BeatBox.new
      bb.prepend("bop boop beep")
      expect(bb.list.to_string).to eq("beep boop bop")
    end
    
    it 'will only accept certain sounds.' do
      bb = BeatBox.new
      bb.prepend("bopbop boo fun! bee beep is bop boo coding boop beep")
      expect(bb.list.to_string).to eq('beep boop boo bop beep bee boo bopbop')
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

  describe '.rate and .reset_rate' do
    bb = BeatBox.new
    bb.append("beep beep boop bop boop bop bop")
    it 'will change the rate that BeatBox plays' do
      expect(bb.rate).to eq(500)
      bb.rate = 100
      expect(bb.play).to eq(100)
    end

    it 'will reset the rate to 500' do
      bb.rate = 100
      expect(bb.rate).to eq(100)
      bb.reset_rate
      expect(bb.rate).to eq(500)
    end
  end

  describe '.voice and .reset_voice' do
    bb = BeatBox.new
    bb.append("beep beep boop bop boop bop bop")
    it 'will change tthe voice used by BeatBox' do
      expect(bb.voice).to eq("Boing")
      bb.voice = "Daniel"
      expect(bb.voice).to eq("Daniel")
    end
    
    it 'will reset the voice to Boing' do
      bb.voice = "Daniel"
      expect(bb.voice).to eq("Daniel")
      bb.reset_voice
      expect(bb.voice).to eq("Boing")
    end
  end 
end