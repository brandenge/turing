require './lib/jeep'

RSpec.describe Jeep do
  before :each do
    @jeep = Jeep.new
  end

  it 'exists' do
    expect(@jeep).to be_a(Jeep)
  end

  it 'can start' do
    expect(@jeep.start).to eq("Engine on!")
  end

  it 'can stop' do
    expect(@jeep.stop).to eq("Engine off!")
  end

  it 'can drive' do
    expect(@jeep.drive).to eq("All wheels go!")
  end

  it 'can turn on the air conditioning' do
    expect{@jeep.turn_on_ac}.to output("Chilly air coming your way!\n").to_stdout
  end

  it 'can turn off the air conditioning' do
    expect{@jeep.turn_off_ac}.to output("Temp is fine in here.\n").to_stdout
  end
end
