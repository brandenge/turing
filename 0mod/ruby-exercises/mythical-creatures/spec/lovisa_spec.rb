require 'rspec'
require './lib/lovisa'

RSpec.describe Lovisa do
  it 'she has a title' do
    lovisa = Lovisa.new('Lovisa the Swedish Goddess')
    expect(lovisa.title).to eq('Lovisa the Swedish Goddess')
  end

  it 'she is brilliant by default' do
    lovisa = Lovisa.new('Lovisa the Mentor')
    expect(lovisa.characteristics).to eq(['brilliant'])
    expect(lovisa.brilliant?).to eq(true)
    expect(lovisa.brilliant?).to be true
  end

  it "she is more than brilliant" do
    lovisa = Lovisa.new('Lovisa the friend', ['brilliant', 'kind'])
    expect(lovisa.characteristics).to eq(['brilliant', 'kind'])
    expect(lovisa.brilliant?).to eq(true)
    expect(lovisa.brilliant?).to be true
    expect(lovisa.kind?).to eq(true)
    expect(lovisa.kind?).to be true
  end

  it 'she says sparkly stuff' do
    lovisa = Lovisa.new('Lovisa the Loved')
    expect(lovisa.say('Wonderful!')).to eq('**;* Wonderful! **;*')
    expect(lovisa.say('You are doing great!')).to eq('**;* You are doing great! **;*')
  end
end
