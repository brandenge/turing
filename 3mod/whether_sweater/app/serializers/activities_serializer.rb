class ActivitiesSerializer
  include JSONAPI::Serializer

  set_id { |_| nil }

  attributes :destination
  attributes :forecast do

  end
  attributes :activities do

  end
end
