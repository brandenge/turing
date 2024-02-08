require 'rspec'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

RSpec.describe JungleBeat do
  before(:each) do
    @jb = JungleBeat.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@jb).to be_a(JungleBeat)
    end

    it 'initializes @list to an empty LinkedList' do
      expect(@jb.list).to be_a(LinkedList)
      expect(@jb.list.head).to eq(nil)
    end

    it 'initializes @rate' do
      expect(@jb.rate).to eq(JungleBeat::DEFAULTS[:rate])
    end

    it 'initializes @voice' do
      expect(@jb.voice).to eq('Boing')
    end

    it 'accepts an argument and appends the string of beats to the list' do
      jb = JungleBeat.new('deep dop dop deep')
      expect(jb.all).to eq('deep dop dop deep')
    end
  end

  describe '#append' do
    it 'appends 1 beat at once' do
      @jb.append('deep')
      expect(@jb.all).to eq('deep')
    end

    it 'appends 2 beats at once' do
      @jb.append('deep doo')
      expect(@jb.all).to eq('deep doo')
    end

    it 'appends 3 beats at once' do
      @jb.append('deep doo ditt')
      expect(@jb.all).to eq('deep doo ditt')
    end

    it 'appends an additional 3 beats' do
      @jb.append('deep doo ditt')
      @jb.append('woo hoo shu')
      expect(@jb.all).to eq('deep doo ditt woo hoo shu')
    end
  end

  describe '#count' do
    it 'has a count of 0 when its list is empty' do
      expect(@jb.count).to eq(0)
    end

    it 'has a count of 1 when its list has 1 node' do
      @jb.append('deep')
      expect(@jb.count).to eq(1)
    end

    it 'has a count of 2 when its list has 2 nodes' do
      @jb.append('deep doo')
      expect(@jb.count).to eq(2)
    end

    it 'has a count of 3 when its list has 3 nodes' do
      @jb.append('deep doo ditt')
      expect(@jb.count).to eq(3)
    end

    it 'has a count of 6 when its list has 6 nodes' do
      @jb.append('deep doo ditt')
      @jb.append('woo hoo shu')
      expect(@jb.count).to eq(6)
    end
  end

  describe '#play' do
    it 'returns the count' do
      @jb.append('deep doo')
      expect(@jb.play).to eq(2)
    end

    it 'returns a different count' do
      @jb.append('woo hoo shu')
      expect(@jb.play).to eq(3)
    end
  end

  describe '#all' do
    it "returns a string of the nodes' data in the list" do
      @jb.append('deep doo ditt')
      expect(@jb.all).to eq(@jb.list.to_string)
    end

    it "returns a different string of the nodes' data in the list" do
      @jb.append('woo hoo shu')
      expect(@jb.all).to eq(@jb.list.to_string)
    end
  end

  describe '#prepend' do
    it 'prepends 1 beat at once' do
      @jb.prepend('deep')
      expect(@jb.list.head.data).to eq('deep')
      expect(@jb.list.head.next_node).to eq(nil)
      expect(@jb.all).to eq('deep')
    end

    it 'prepends 2 beats at once' do
      @jb.prepend('deep doo')
      expect(@jb.all).to eq('deep doo')
    end

    it 'prepends 3 beats at once' do
      @jb.prepend('deep doo ditt')
      expect(@jb.all).to eq('deep doo ditt')
    end

    it 'prepends 1 beat 2 times' do
      @jb.prepend('deep')
      @jb.prepend('doo')
      expect(@jb.all).to eq('doo deep')
    end

    it 'prepends 1 beat 3 times' do
      @jb.prepend('deep')
      @jb.prepend('doo')
      @jb.prepend('ditt')
      expect(@jb.all).to eq('ditt doo deep')
    end

    it 'prepends an additional 3 beats' do
      @jb.prepend('deep doo ditt')
      @jb.prepend('woo hoo shu')
      expect(@jb.all).to eq('woo hoo shu deep doo ditt')
    end
  end

  describe '#reset_rate' do
    it 'returns the default value' do
      expect(@jb.reset_rate).to eq(JungleBeat::DEFAULTS[:rate])
    end

    it 'resets the rate' do
      @jb.rate = 100
      expect(@jb.rate).to eq(100)
      @jb.reset_rate
      expect(@jb.rate).to eq(JungleBeat::DEFAULTS[:rate])
    end

    it 'resets the rate again' do
      @jb.rate = 100
      expect(@jb.rate).to eq(100)
      @jb.rate = 300
      expect(@jb.rate).to eq(300)
      @jb.reset_rate
      expect(@jb.rate).to eq(JungleBeat::DEFAULTS[:rate])
    end

    it 'resetting the rate multiple times has no effect' do
      @jb.rate = 100
      expect(@jb.rate).to eq(100)
      @jb.reset_rate
      expect(@jb.rate).to eq(JungleBeat::DEFAULTS[:rate])
      @jb.reset_rate
      expect(@jb.rate).to eq(JungleBeat::DEFAULTS[:rate])
    end
  end

  describe '#reset_voice' do
    it 'returns the default value' do
      expect(@jb.reset_voice).to eq(JungleBeat::DEFAULTS[:voice])
    end

    it 'resets the voice' do
      @jb.voice = 'Daniel'
      expect(@jb.voice).to eq('Daniel')
      @jb.reset_voice
      expect(@jb.voice).to eq(JungleBeat::DEFAULTS[:voice])
    end

    it 'resets the voice again' do
      @jb.voice = 'Daniel'
      expect(@jb.voice).to eq('Daniel')
      @jb.voice = 'Tom'
      expect(@jb.voice).to eq('Tom')
      @jb.reset_voice
      expect(@jb.voice).to eq(JungleBeat::DEFAULTS[:voice])
    end

    it 'resetting the rate multiple times has no effect' do
      @jb.voice = 'Daniel'
      expect(@jb.voice).to eq('Daniel')
      @jb.reset_voice
      expect(@jb.voice).to eq(JungleBeat::DEFAULTS[:voice])
      @jb.reset_voice
      expect(@jb.voice).to eq(JungleBeat::DEFAULTS[:voice])
    end
  end
end
