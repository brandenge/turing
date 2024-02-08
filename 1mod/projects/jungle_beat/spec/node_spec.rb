require 'rspec'
require './lib/node'

RSpec.describe Node do
  before(:each) do
    @node_1 = Node.new('plop')
    @node_2 = Node.new('doop')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@node_1).to be_a(Node)
    end

    it 'exists again' do
      expect(@node_2).to be_a(Node)
    end
  end

  describe '#data' do
    it 'has data' do
      expect(@node_1.data).to eq('plop')
    end

    it 'has different data' do
      expect(@node_2.data).to eq('doop')
    end
  end

  describe '#next_node' do
    it 'initializes a next_node to nil' do
      expect(@node_1.next_node).to eq(nil)
    end
  end
end
