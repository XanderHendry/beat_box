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

end