require './spec/spec_helper'
require './lib/centaur'

RSpec.describe Centaur do
  before do
    @centaur = Centaur.new('George', 'Palomino')
  end

  it 'has a name' do
    expect(@centaur.name).to eq('George')
  end

  it 'has a horse breed' do
    expect(@centaur.breed).to eq('Palomino')
  end

  it 'has excellent bow skills' do
    expect(@centaur.shoot).to eq('Twang!!!')
  end

  it 'makes a horse sound when it runs' do
    expect(@centaur.run).to eq('Clop clop clop clop!')
  end

  it 'when first created, it is not cranky' do
    expect(@centaur.cranky?).to be false
  end

  it 'when first created, it is standing up' do
    expect(@centaur.standing?).to be true
  end

  it 'gets tired after running or shooting a bow thrice' do
    expect(@centaur.cranky?).to be false

    @centaur.run
    @centaur.shoot
    @centaur.run

    expect(@centaur.cranky?).to be true
  end

  it 'will not shoot a bow when cranky' do
    expect(@centaur.cranky?).to be false

    3.times { @centaur.shoot }

    expect(@centaur.shoot).to eq('NO!')
  end

  it 'will not sleep when it is standing' do
    expect(@centaur.sleep).to eq('NO!')
  end

  it 'is not standing after laying down' do
    @centaur.lay_down

    expect(@centaur.standing?).to be false
    expect(@centaur.laying?).to be true
  end

  it 'can sleep when laying down' do
    @centaur.lay_down
    expect(@centaur.sleep).to_not eq('NO!')
  end

  it 'cannot shoot a bow when laying down' do
    @centaur.lay_down
    expect(@centaur.shoot).to eq('NO!')
  end

  it 'cannot run while laying down' do
    @centaur.lay_down
    expect(@centaur.run).to eq('NO!')
  end

  it 'can stand up' do
    @centaur.lay_down
    @centaur.stand_up
    expect(@centaur.standing?).to be true
  end

  it 'is no longer cranky after sleeping' do
    @centaur.shoot
    @centaur.run
    @centaur.shoot

    expect(@centaur.cranky?).to be true

    @centaur.lay_down
    @centaur.sleep

    expect(@centaur.cranky?).to be false

    @centaur.stand_up

    expect(@centaur.shoot).to eq('Twang!!!')
    expect(@centaur.run).to eq('Clop clop clop clop!')
  end

  it 'becomes rested after drinking a potion' do
    @centaur.shoot
    @centaur.run
    @centaur.shoot

    expect(@centaur.cranky?).to be true

    @centaur.drink_potion

    expect(@centaur.cranky?).to be false
  end

  it 'can only drink a potion whilst standing' do
    expect(@centaur.standing?).to be true

    @centaur.lay_down

    expect(@centaur.standing?).to be false
    expect(@centaur.drink_potion).to eq('NO!')
  end

  it 'gets stick if a potion is drunk while rested' do
    expect(@centaur.sick?).to be false
    expect(@centaur.cranky?).to be false

    @centaur.drink_potion

    expect(@centaur.sick?).to be true
  end
end
