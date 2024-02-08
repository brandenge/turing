class AutomaticTellerMachineSerializer
  include JSONAPI::Serializer

  set_id do |_|
    nil
  end
  set_type :atm

  attributes :name,
             :address,
             :lat,
             :lon,
             :distance
end
