# ./amazon_order.rb
require './lib/online_order'

class AmazonOrder
  include OnlineOrder
  attr_reader :type,
              :time

  def initialize(type, time)
    @type = type
    @time = time
  end
end
