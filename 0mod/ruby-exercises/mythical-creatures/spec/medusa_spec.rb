require 'rspec'
require './lib/medusa'

RSpec.describe Medusa do
  it 'has a name' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.name).to eq('Cassiopeia')
  end

  it 'has no statues when created' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.statues).to be_empty
  end

  it 'gains a statue when staring at a person' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    medusa.stare(victim)
    expect(medusa.statues.count).to eq(1)
    expect(medusa.statues.first.name).to eq('Perseus')
    expect(medusa.statues.first).to be_an_instance_of(Person)
  end

  it 'turns a person to stone when staring at them' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    expect(victim.stoned?).to be false
    medusa.stare(victim)
    expect(victim.stoned?).to be true
  end

  it 'can only have three victims' do
    medusa = Medusa.new('Cassiopeia')
    victim1 = Person.new('Perseus')
    victim2 = Person.new('Bob')
    victim3 = Person.new('Tom')

    expect(victim1.stoned?).to be false
    expect(victim2.stoned?).to be false
    expect(victim3.stoned?).to be false

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)

    expect(victim1.stoned?).to be true
    expect(victim2.stoned?).to be true
    expect(victim3.stoned?).to be true
  end

  it 'if a fourth victim is stoned the first is unstoned' do
    medusa = Medusa.new('Cassiopeia')
    victim1 = Person.new('Perseus')
    victim2 = Person.new('Bob')
    victim3 = Person.new('Tom')
    victim4 = Person.new('Al')

    expect(victim1.stoned?).to be false
    expect(victim2.stoned?).to be false
    expect(victim3.stoned?).to be false
    expect(victim4.stoned?).to be false

    medusa.stare(victim1)
    medusa.stare(victim2)
    medusa.stare(victim3)

    expect(victim1.stoned?).to be true
    expect(victim2.stoned?).to be true
    expect(victim3.stoned?).to be true
    expect(victim4.stoned?).to be false

    medusa.stare(victim4)

    expect(victim1.stoned?).to be false
    expect(victim2.stoned?).to be true
    expect(victim3.stoned?).to be true
    expect(victim4.stoned?).to be true
  end
end
