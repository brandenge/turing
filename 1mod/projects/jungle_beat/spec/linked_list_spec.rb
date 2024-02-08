require 'rspec'
require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  data_1 = 'plop'
  data_2 = 'doop'
  data_3 = 'deep'
  data_4 = 'woo'

  before(:each) do
    @linked_list = LinkedList.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@linked_list).to be_a(LinkedList)
    end

    it 'initializes head to equal nil' do
      expect(@linked_list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'appends 1 node' do
      @linked_list.append(data_1)
      expect(@linked_list.to_string).to eq("#{data_1}")
    end

    it 'appends 2 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2}")
    end

    it 'appends 3 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2} #{data_3}")
    end
  end

  describe '#count' do
    it 'starts with 0 nodes counted' do
      expect(@linked_list.count).to eq(0)
    end

    it 'counts 1 node' do
      @linked_list.append(data_1)
      expect(@linked_list.count).to eq(1)
    end

    it 'counts 2 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      expect(@linked_list.count).to eq(2)
    end

    it 'counts 3 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      expect(@linked_list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'returns an empty string for an empty linked list' do
      expect(@linked_list.to_string).to eq('')
    end

    it 'returns the proper string for 1 node' do
      @linked_list.append(data_1)
      expect(@linked_list.to_string).to eq("#{data_1}")
    end

    it 'returns the proper string for 2 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2}")
    end

    it 'returns the proper string for 3 nodes' do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2} #{data_3}")
    end
  end

  describe '#prepend' do
    it 'prepends 1 node' do
      node = @linked_list.prepend(data_1)
      expect(@linked_list.to_string).to eq("#{data_1}")
    end

    it 'prepends 2 nodes' do
      @linked_list.prepend(data_1)
      @linked_list.prepend(data_2)
      expect(@linked_list.to_string).to eq("#{data_2} #{data_1}")
    end

    it 'prepends 3 nodes' do
      @linked_list.prepend(data_1)
      @linked_list.prepend(data_2)
      @linked_list.prepend(data_3)
      expect(@linked_list.to_string).to eq("#{data_3} #{data_2} #{data_1}")
    end
  end

  describe '#insert' do
    before(:each) do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
    end

    it 'inserts at the start of a list' do
      @linked_list.insert(0, data_4)
      expect(@linked_list.to_string)
      .to eq("#{data_4} #{data_1} #{data_2} #{data_3}")
    end

    it 'inserts at the end of a list' do
      @linked_list.insert(3, data_4)
      expect(@linked_list.to_string)
      .to eq("#{data_1} #{data_2} #{data_3} #{data_4}")
    end

    it 'inserts in the midddle of a list' do
      @linked_list.insert(2, data_4)
      expect(@linked_list.to_string)
      .to eq("#{data_1} #{data_2} #{data_4} #{data_3}")
    end
  end

  describe '#find' do
    before(:each) do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      @linked_list.append(data_4)
    end

    it 'finds the first 4 elements' do
      expect(@linked_list.find(0, 4))
      .to eq("#{data_1} #{data_2} #{data_3} #{data_4}")
    end

    it 'finds the 2nd and 3rd elements' do
      expect(@linked_list.find(1, 2)).to eq("#{data_2} #{data_3}")
    end

    it 'returns nil if the index given is a negative number' do
      expect(@linked_list.find(-1, 2)).to eq(nil)
    end

    it 'returns nil if the number of elements is less than or equal to 0' do
      expect(@linked_list.find(1, 0)).to eq(nil)
    end
  end

  describe '#includes?' do
    before(:each) do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
      @linked_list.append(data_4)
    end

    it 'returns true when the data is included' do
      expect(@linked_list.includes?(data_1)).to eq(true)
      expect(@linked_list.includes?(data_2)).to eq(true)
      expect(@linked_list.includes?(data_3)).to eq(true)
      expect(@linked_list.includes?(data_4)).to eq(true)
    end

    it 'returns false when the data is not included' do
      expect(@linked_list.includes?('h9$!61Yf2BXvGZjM0q5AvCz7Igk')).to eq(false)
      expect(@linked_list.includes?('')).to eq(false)
      expect(@linked_list.includes?(nil)).to eq(false)
      expect(@linked_list.includes?('dep')).to eq(false)
    end
  end

  describe '#pop' do
    before(:each) do
      @linked_list.append(data_1)
      @linked_list.append(data_2)
      @linked_list.append(data_3)
    end

    it 'removes 1 element' do
      @linked_list.pop
      expect(@linked_list.to_string).to eq("#{data_1} #{data_2}")
    end

    it 'returns the popped node' do
      expect(@linked_list.pop).to be_a(Node)
    end

    it 'removes 2 elements' do
      @linked_list.pop
      @linked_list.pop
      expect(@linked_list.to_string).to eq("#{data_1}")
    end

    it 'resets the head to nil when removing the last node' do
      @linked_list.pop
      @linked_list.pop
      @linked_list.pop
      expect(@linked_list.to_string).to eq('')
      expect(@linked_list.head).to eq(nil)
    end

    it 'does nothing when used on an already empty linked list' do
      linked_list = LinkedList.new
      expect(linked_list.to_string).to eq('')
      expect(linked_list.head).to eq(nil)

      linked_list.pop
      expect(linked_list.to_string).to eq('')
      expect(linked_list.head).to eq(nil)
    end
  end
end
