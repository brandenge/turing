class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log

  def initialize(name:, min_height:, admission_fee:, excitement:)
    @name = name
    @min_height = min_height
    @admission_fee = admission_fee
    @excitement = excitement
    @rider_log = Hash.new(0)
  end

  def total_revenue
    @rider_log.values.sum * @admission_fee
  end

  def board_rider(visitor)
    return if visitor.spending_money < @admission_fee
    return if visitor.height < @min_height
    return if !visitor.preferences.include?(@excitement)

    visitor.pay_admission_fee(@admission_fee)
    @rider_log[visitor] += 1
  end
end
