require 'rspec'
require './lib/werewolf'

RSpec.describe Werewolf do
  before do
    @werewolf = Werewolf.new('David', 'London')
  end

  it 'has a name' do
    expect(@werewolf.name).to eq('David')
  end

  it 'has a location' do
    expect(@werewolf.location).to eq('London')
  end

  it 'is by default human' do
    expect(@werewolf.human?).to be true
  end

  it 'when starting as a human, changing makes it turn into a werewolf' do
    @werewolf.change!
    expect(@werewolf.wolf?).to be true
    expect(@werewolf.human?).to be false
  end

  it 'when starting as a human, changing again makes it be human again' do
    expect(@werewolf.human?).to be true

    @werewolf.change!

    expect(@werewolf.human?).to be false

    @werewolf.change!

    expect(@werewolf.human?).to be true
  end

  it 'when starting as a werewolf, changing a second time makes it a werewolf' do
    @werewolf.change!
    expect(@werewolf.wolf?).to be true

    @werewolf.change!
    @werewolf.change!

    expect(@werewolf.wolf?).to be true
  end

  it 'is not hungry by default' do
    expect(@werewolf.hungry?).to be false
  end

  it 'becomes hungry after changing to a werewolf' do
    expect(@werewolf.hungry?).to be false

    @werewolf.change!

    expect(@werewolf.hungry?).to be true
  end

  class Victim
    attr_accessor :status

    def initialize
      @status = :alive
    end
  end

  it 'consumes a victim' do
    victim = Victim.new
    expect(victim.status).to eq(:alive)

    @werewolf.change!
    @werewolf.consume(victim)

    expect(victim.status).to eq(:dead)
  end

  it 'cannot consume a victim if it is in human form' do
    victim = Victim.new
    @werewolf.consume(victim)

    expect(victim.status).to eq(:alive)
  end

  it 'a werewolf that has consumed a human being is no longer hungry' do
    victim = Victim.new
    @werewolf.change!

    expect(@werewolf.hungry?).to be true

    @werewolf.consume(victim)

    expect(@werewolf.hungry?).to be false
  end

  it 'a werewolf who has consumed a victim makes the victim dead' do
    victim = Victim.new

    expect(victim.status).to eq(:alive)

    @werewolf.change!
    @werewolf.consume(victim)

    expect(victim.status).to eq(:dead)
  end
end
