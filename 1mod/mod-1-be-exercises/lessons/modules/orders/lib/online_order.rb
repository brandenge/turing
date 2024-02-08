# ./online_order.rb
module OnlineOrder
  def confirmation(thing)
    "You got #{thing}."
  end

  def delivery
    "Your #{@type} will arrive in #{@time}."
  end

  def review
    "Please rate your order within 30 days."
  end
end
