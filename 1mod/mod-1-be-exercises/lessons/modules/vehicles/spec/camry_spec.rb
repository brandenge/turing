require './lib/camry'

RSpec.describe Camry do
  before :each do
    @camry = Camry.new
  end

  it 'exists' do
    expect(@camry).to be_a(Camry)
  end

  it 'can start' do
    expect(@camry.start).to eq("Engine on!")
  end

  it 'can stop' do
    expect(@camry.stop).to eq("Engine off!")
  end

  it 'can drive' do
    expect(@camry.drive).to eq("Back wheels go!")
  end

  it 'can turn on the air conditioning' do
    expect{@camry.turn_on_ac}.to output("Chilly air coming your way!\n").to_stdout
  end

  it 'can turn off the air conditioning' do
    expect{@camry.turn_off_ac}.to output("Temp is fine in here.\n").to_stdout
  end
end
