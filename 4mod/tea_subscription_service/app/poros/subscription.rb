class Subscription
  attr_reader :id,
              :customer_id,
              :tea_id,
              :title,
              :price,
              :status,
              :frequency

  def initialize(data)
    @id = data[:id]
    @customer_id = data[:customer_id]
    @tea_id = data[:tea_id]
    @title = data[:title]
    @price = data[:price]
    @status = data[:status]
    @frequency = data[:frequency]
  end
end
