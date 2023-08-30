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
    
    it 'contains an empty LinkedList by default' do
      bb = BeatBox.new
      expect(bb.list).to be_instance_of(LinkedList)
    end

    it 'does not have to have an empty LinkedList' do
      bb = BeatBox.new("beep")
      expect(bb.to_string).to eq("beep")
    end

    it 'can be initialized with multiple sounds to add to the list' do
      bb = BeatBox.new("beep boop bop bee boop boo bopbop")
      expect(bb.to_string).to eq("beep boop bop bee boop boo bopbop")      
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

  describe '.insert' do
    it 'will add sounds to the list using the indicated position' do
      bb = BeatBox.new("beep boop bop")
      bb.insert(1, "beep")
      expect(bb.list.to_string).to eq("beep beep boop bop")
    end

    it 'will add multiple sounds at once' do
      bb = BeatBox.new("beep boop bop")
      bb.insert(2, "bop boop beep")
      expect(bb.list.to_string).to eq("beep boop beep boop bop bop")
    end
    
    it 'will only accept certain sounds.' do
      bb = BeatBox.new("beep boop bop")
      bb.insert(1, "bopbop boo fun! bee beep is bop boo coding boop beep")
      expect(bb.list.to_string).to eq('beep beep boop boo bop beep bee boo bopbop boop bop')
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
      expect(bb.play).to eq(`say -r 500 -v Boing "beep beep boop bop boop bop bop"`)
    end
  end

  describe '.rate and .reset_rate' do
    bb = BeatBox.new
    bb.append("beep beep boop bop boop bop bop")
    it 'will change the rate that BeatBox plays' do
      bb.rate = 100
      expect(bb.play).to eq(`say -r 100 -v Boing "beep beep boop bop boop bop bop"`)
    end

    it 'will reset the rate to 500' do
      bb.rate = 100
      expect(bb.reset_rate).to eq(500)

    end
  end

  describe '.voice and .reset_voice' do
    bb = BeatBox.new
    bb.append("beep beep boop bop boop bop bop")
    it 'will change the voice used by BeatBox' do
      expect(bb.play).to eq(`say -r 500 -v Boing "beep beep boop bop boop bop bop"`)
      bb.voice = "Daniel"
      expect(bb.play).to eq(`say -r 500 -v Daniel "beep beep boop bop boop bop bop"`)
    end
    
    it 'will reset the voice to Boing' do
      bb.voice = "Daniel"
      expect(bb.reset_voice).to eq("Boing")
    end
  end 
end