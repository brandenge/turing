require 'spec_helper'

RSpec.describe VehicleFactory do
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  ny_registrations = DmvDataService.new.ny_registrations
  factory = VehicleFactory.new
  wa_ev_vehicles = factory.create_vehicles(wa_ev_registrations)
  ny_vehicles = factory.create_vehicles(ny_registrations)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'returns an array' do
      expect(wa_ev_vehicles).to be_a(Array)
      expect(ny_vehicles).to be_a(Array)
    end

    it 'returns an array of Vehicle objects' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) })
        .to be(true)
    end

    it 'assigns the @vin attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.vin.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.vin.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @year attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.year.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.year.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @make attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.make.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.make.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @model attribute on every vehicle to a string value or nil' do
      expect(wa_ev_vehicles.all? do |vehicle|
        vehicle.model.is_a?(String) || vehicle.model == nil
      end).to be(true)
      expect(ny_vehicles.all? do |vehicle|
        vehicle.model.is_a?(String) || vehicle.model == nil
      end).to be(true)
    end

    it 'assigns the @engine attribute on every vehicle to a symbol value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) })
        .to be(true)
    end

    it 'assigns the correct attributes and values to WA vehicles' do
      wa_ev_vehicle_1 = factory.create_vehicles(wa_ev_registrations).first

      expect(wa_ev_vehicle_1.vin).to eq(WA_EV_VEHICLE_1[:vin])
      expect(wa_ev_vehicle_1.year).to eq(WA_EV_VEHICLE_1[:year])
      expect(wa_ev_vehicle_1.make).to eq(WA_EV_VEHICLE_1[:make])
      expect(wa_ev_vehicle_1.model).to eq(WA_EV_VEHICLE_1[:model])
      expect(wa_ev_vehicle_1.engine).to eq(WA_EV_VEHICLE_1[:engine])
      expect(wa_ev_vehicle_1.registration_date).to be(nil)
    end

    it 'assigns the correct attributes and values to NY vehicles' do
      ny_vehicle_1 = factory.create_vehicles(ny_registrations).first

      expect(ny_vehicle_1.vin).to eq(NY_VEHICLE_1[:vin])
      expect(ny_vehicle_1.year).to eq(NY_VEHICLE_1[:year])
      expect(ny_vehicle_1.make).to eq(NY_VEHICLE_1[:make])
      expect(ny_vehicle_1.model).to eq(NY_VEHICLE_1[:model])
      expect(ny_vehicle_1.engine).to eq(NY_VEHICLE_1[:engine])
      expect(ny_vehicle_1.registration_date).to be(nil)
    end

    it 'returns nil for invalid state data' do
      expect(factory.create_vehicles([])).to be(nil)
    end
  end

  describe '#get_us_state' do
    it 'returns the :WA symbol for Washington state vehicle data' do
      expect(factory.get_us_state(wa_ev_registrations)).to be(:WA)
    end

    it 'returns the :NY symbol for New York state vehicle data' do
      expect(factory.get_us_state(ny_registrations)).to be(:NY)
    end

    it 'returns nil for any other invalid vehicle data' do
      expect(factory.get_us_state([])).to be(nil)
    end
  end

  describe '#make_model_counts' do
    actual = factory.make_model_counts(wa_ev_vehicles)

    it 'returns a hash' do
      expect(actual).to be_a(Hash)
    end

    it 'it has keys that are symbols of the make and model' do
      expect(actual.all? { |key, _| key.is_a?(Symbol) }).to be(true)
    end

    it 'it has values that are integers representing the counts of each key' do
      expect(actual.all? { |_, value| value.is_a?(Integer) }).to be(true)
    end
  end

  describe '#model_year_counts' do
    actual = factory.model_year_counts(wa_ev_vehicles)

    it 'returns a hash' do
      expect(actual).to be_a(Hash)
    end

    it 'it has keys that are symbols of model years' do
      expect(actual.all? { |key, _| key.is_a?(Symbol) }).to be(true)
    end

    it 'it has values that are integers representing the counts of each key' do
      expect(actual.all? { |_, value| value.is_a?(Integer) }).to be(true)
    end

    it 'returns the correct count for each key' do
      expect(actual[:'2013']).to eq(115)
      expect(actual[:'2018']).to eq(106)
      expect(actual[:'2022']).to eq(76)
      expect(actual[:'2012']).to eq(20)
    end
  end

  describe '#counts_hash' do
    make_model_keys = wa_ev_vehicles.map do |vehicle|
      :"#{vehicle.make} #{vehicle.model}"
    end
    actual = factory.counts_hash(make_model_keys)

    it 'returns a hash with keys and their respective counts in the array of keys' do
      expect(actual).to be_a(Hash)
    end

    it 'has keys that are the same data type as the elements of the array of keys' do
      make_model_key = factory.make_model_counts(wa_ev_vehicles).keys.first

      expect(actual.keys.all? { |key| key.class == make_model_key.class })
        .to be(true)
    end

    it 'it has values that are integers representing the counts of each key' do
      expect(actual.all? { |_, value| value.is_a?(Integer) }).to be(true)
    end

    it 'returns the correct count for each key' do
      expect(actual[:'NISSAN Leaf']).to eq(256)
    end
  end

  describe '#registered_vehicle_count_for_model_year' do
    it 'returns an integer' do
      expect(factory.registered_vehicle_count_for_model_year(wa_ev_vehicles, 2013)).to be_a(Integer)
    end

    it 'returns the correct counts for the given year' do
      expect(factory.registered_vehicle_count_for_model_year(wa_ev_vehicles, 2013)).to eq(115)
      expect(factory.registered_vehicle_count_for_model_year(wa_ev_vehicles, 2018)).to eq(106)
      expect(factory.registered_vehicle_count_for_model_year(wa_ev_vehicles, 2022)).to eq(76)
      expect(factory.registered_vehicle_count_for_model_year(wa_ev_vehicles, 2012)).to eq(20)
    end
  end

  describe '#county_with_most_registered_vehicles' do
    it 'returns a string' do
      expect(factory.county_with_most_registered_vehicles(wa_ev_registrations))
        .to be_a(String)
    end

    it 'returns the correct county with the most registrations' do
      expect(factory.county_with_most_registered_vehicles(wa_ev_registrations))
        .to eq('King')
    end
  end

  describe '#most_popular_make_model' do
    actual = factory.most_popular_make_model(wa_ev_vehicles)
    expected = :'NISSAN Leaf'

    it 'returns a symbol' do
      expect(actual).to be_a(Symbol)
    end

    it 'returns the most popular make/model registered for WA ev data' do
      expect(actual).to eq(expected)
    end
  end

  describe '#create_wa_ev_vehicles' do
    it 'assigns the correct attributes and values to the first WA vehicle' do
      wa_ev_vehicle_1 = factory.create_wa_ev_vehicles(wa_ev_registrations).first

      expect(wa_ev_vehicle_1.vin).to eq(WA_EV_VEHICLE_1[:vin])
      expect(wa_ev_vehicle_1.year).to eq(WA_EV_VEHICLE_1[:year])
      expect(wa_ev_vehicle_1.make).to eq(WA_EV_VEHICLE_1[:make])
      expect(wa_ev_vehicle_1.model).to eq(WA_EV_VEHICLE_1[:model])
      expect(wa_ev_vehicle_1.engine).to eq(WA_EV_VEHICLE_1[:engine])
      expect(wa_ev_vehicle_1.registration_date).to be(nil)
    end

    it 'assigns the correct attributes and values to the last WA vehicles' do
      wa_ev_vehicle_2 = factory.create_wa_ev_vehicles(wa_ev_registrations).last

      expect(wa_ev_vehicle_2.vin).to eq(WA_EV_VEHICLE_2[:vin])
      expect(wa_ev_vehicle_2.year).to eq(WA_EV_VEHICLE_2[:year])
      expect(wa_ev_vehicle_2.make).to eq(WA_EV_VEHICLE_2[:make])
      expect(wa_ev_vehicle_2.model).to eq(WA_EV_VEHICLE_2[:model])
      expect(wa_ev_vehicle_2.engine).to eq(WA_EV_VEHICLE_2[:engine])
      expect(wa_ev_vehicle_2.registration_date).to be(nil)
    end
  end

  describe '#create_ny_vehicles' do
    it 'assigns the correct attributes and values to the first NY vehicle' do
      ny_vehicle_1 = factory.create_ny_vehicles(ny_registrations).first

      expect(ny_vehicle_1.vin).to eq(NY_VEHICLE_1[:vin])
      expect(ny_vehicle_1.year).to eq(NY_VEHICLE_1[:year])
      expect(ny_vehicle_1.make).to eq(NY_VEHICLE_1[:make])
      expect(ny_vehicle_1.model).to eq(NY_VEHICLE_1[:model])
      expect(ny_vehicle_1.engine).to eq(NY_VEHICLE_1[:engine])
      expect(ny_vehicle_1.registration_date).to be(nil)
    end

    it 'assigns the correct attributes and values to the last NY vehicle' do
      ny_vehicle_2 = factory.create_ny_vehicles(ny_registrations).last

      expect(ny_vehicle_2.vin).to eq(NY_VEHICLE_2[:vin])
      expect(ny_vehicle_2.year).to eq(NY_VEHICLE_2[:year])
      expect(ny_vehicle_2.make).to eq(NY_VEHICLE_2[:make])
      expect(ny_vehicle_2.model).to eq(NY_VEHICLE_2[:model])
      expect(ny_vehicle_2.engine).to eq(NY_VEHICLE_2[:engine])
      expect(ny_vehicle_2.registration_date).to be(nil)
    end
  end
end
