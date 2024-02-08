class TeaSerializer
  include JSONAPI::Serializer

  set_type :tea

  attributes :customer_id,
             :tea_id,
             :title,
             :price,
             :status,
             :frequency,
             :created_at,
             :updated_at
end
