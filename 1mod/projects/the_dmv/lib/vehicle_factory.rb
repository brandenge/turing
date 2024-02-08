require './lib/vehicle'

class VehicleFactory
  def create_vehicles(vehicle_data)
    case get_us_state(vehicle_data)
      when :WA then create_wa_ev_vehicles(vehicle_data)
      when :NY then create_ny_vehicles(vehicle_data)
      else nil
    end
  end

  def get_us_state(vehicle_data)
    case
      when vehicle_data&.first&.dig(:state_of_residence) == 'WA' then :WA
      when vehicle_data&.first&.dig(:state) == 'NY' then :NY
      else nil
    end
  end

  def make_model_counts(vehicles)
    make_models = vehicles.map do |vehicle|
      :"#{vehicle.make} #{vehicle.model}"
    end
    counts_hash(make_models)
  end

  def model_year_counts(vehicles)
    model_years = vehicles.map do |vehicle|
      vehicle.year.to_sym
    end
    counts_hash(model_years)
  end

  def counts_hash(array_of_keys)
    array_of_keys.uniq.to_h do |key|
      [key, array_of_keys.count(key)]
    end
  end

  def most_popular_make_model(vehicles)
    model_counts = make_model_counts(vehicles)
    max_count = model_counts.values.max
    model_counts.key(max_count)
  end

  def registered_vehicle_count_for_model_year(vehicles, year)
    model_year_counts(vehicles)[year.to_s.to_sym]
  end

  def county_with_most_registered_vehicles(ev_registrations)
    counties = ev_registrations.map{ |registration| registration[:county] }
    county_counts = counts_hash(counties)
    max_count = county_counts.values.max
    county_counts.key(max_count)
  end

  def create_wa_ev_vehicles(vehicle_data)
    vehicle_data.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })
    end
  end

  def create_ny_vehicles(vehicle_data)
    vehicle_data.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: nil,
        engine: :ice
      })
    end
  end
end
