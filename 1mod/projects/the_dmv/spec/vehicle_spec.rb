require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new(CRUZ)
    @bolt = Vehicle.new(BOLT)
    @camaro = Vehicle.new(CAMARO)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
    end

    it 'can initialize a different car' do
      expect(@bolt).to be_an_instance_of(Vehicle)
    end

    it 'can initialize a different car again' do
      expect(@camaro).to be_an_instance_of(Vehicle)
    end
  end

  describe '#vin' do
    it 'has a vin' do
      expect(@cruz.vin).to eq(CRUZ[:vin])
    end

    it 'has a different vin' do
      expect(@bolt.vin).to eq(BOLT[:vin])
      expect(@camaro.vin).to eq(CAMARO[:vin])
    end
  end

  describe '#year' do
    it 'has a vin' do
      expect(@cruz.year).to eq(CRUZ[:year])
    end

    it 'has a different year' do
      expect(@bolt.year).to eq(BOLT[:year])
      expect(@camaro.year).to eq(CAMARO[:year])
    end
  end

  describe '#make' do
    it 'has a make' do
      expect(@cruz.make).to eq(CRUZ[:make])
    end

    it 'has a different make' do
      expect(@bolt.make).to eq(BOLT[:make])
      expect(@camaro.make).to eq(CAMARO[:make])
    end
  end

  describe '#model' do
    it 'has a model' do
      expect(@cruz.model).to eq(CRUZ[:model])
    end

    it 'has a different model' do
      expect(@bolt.model).to eq(BOLT[:model])
      expect(@camaro.model).to eq(CAMARO[:model])
    end
  end

  describe '#engine' do
    it 'has an engine' do
      expect(@cruz.engine).to eq(CRUZ[:engine])
    end

    it 'has a different engine' do
      expect(@bolt.engine).to eq(BOLT[:engine])
      expect(@camaro.engine).to eq(CAMARO[:engine])
    end
  end

  describe '#registration_date' do
    it 'starts as nil' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
    end

    it 'can be assigned to a date object' do
      @cruz.set_registration_date
      expect(@cruz.registration_date).to be_a(Date)
    end
  end

  describe '#plate_type' do
    it 'starts as nil' do
      expect(@cruz.plate_type).to be(nil)
      expect(@bolt.plate_type).to be(nil)
      expect(@camaro.plate_type).to be(nil)
    end

    it 'is set to a symbol after being registered' do
      @cruz.register_plate
      expect(@cruz.plate_type).to be(:regular)
    end

    it 'is can be set to a different symbol after being registered' do
      @bolt.register_plate
      expect(@bolt.plate_type).to be(:ev)
    end
  end

  describe '#antique?' do
    it 'returns false if a vehicle is not older than 25 years old' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
    end

    it 'returns true if a vehicle is older than 25 years old' do
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'returns false if a vehicle is not an electric vehicle' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@camaro.electric_vehicle?).to eq(false)
    end

    it 'returns true if a vehicle is an electric vehicle' do
      expect(@bolt.electric_vehicle?).to eq(true)
    end
  end

  describe '#register_plate' do
    it 'sets a :regular plate' do
      expect(@cruz.plate_type).to be(nil)
      @cruz.register_plate
      expect(@cruz.plate_type).to be(:regular)
    end

    it 'sets an :ev plate' do
      expect(@bolt.plate_type).to be(nil)
      @bolt.register_plate
      expect(@bolt.plate_type).to be(:ev)
    end

    it 'sets an :antique plate' do
      expect(@camaro.plate_type).to be(nil)
      @camaro.register_plate
      expect(@camaro.plate_type).to be(:antique)
    end
  end

  describe '#set_registration_date' do
    it 'sets the registration_date attribute to today\'s date' do
      expect(@cruz.registration_date).to be(nil)
      @cruz.set_registration_date
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'returns today\'s date' do
      expect(@cruz.set_registration_date).to eq(Date.today)
    end
  end
end
