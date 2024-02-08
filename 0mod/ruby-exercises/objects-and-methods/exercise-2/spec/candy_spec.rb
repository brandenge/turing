require 'rspec'
require_relative '../lib/candy'

RSpec.describe Candy do
  it 'has a type' do
    candy = Candy.new('Skittles')

    expect(candy.type).to eq('Skittles')
  end

  it 'can have a different type' do
    candy = Candy.new('Mars')

    expect(candy.type).to eq('Mars')
  end

  it 'has 100g of sugar by default' do
    candy = Candy.new('Smarties')

    expect(candy.sugar).to eq(100)
  end

  it 'can be created with a different amount of sugar'  do
    candy = Candy.new('Pop Rocks', 75)

    expect(candy.sugar).to eq(75)
  end
end
