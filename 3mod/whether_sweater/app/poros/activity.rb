class Activity
  attr_reader :activity,
              :type,
              :participants,
              :price,
              :link,
              :key,
              :accessibility

  def initialize(data)
    @activity = data[:activity]
    @type = data[:type]
    @participants = data[:participants]
    @price = data[:price]
    @link = data[:link]
    @key = data[:key]
    @accessibility = data[:accessibility]
  end
end
