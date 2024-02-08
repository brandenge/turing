class SubscriptionSerializer
  include JSONAPI::Serializer

  set_type :subscription

  attributes :customer_id,
             :tea_id,
             :title,
             :price,
             :status,
             :frequency,
             :created_at,
             :updated_at

  belongs_to :customer
  belongs_to :tea
end
