class Carnival
  @@carnivals = []

  attr_reader :duration,
              :rides

  def self.total_revenue
    @@carnivals.sum { |carnival| carnival.total_revenue }
  end

  def initialize(duration:)
    @duration = duration
    @rides = []
    @@carnivals << self
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by { |ride| ride.rider_log.values.sum }
  end

  def most_profitable_ride
    @rides.max_by { |ride| ride.total_revenue }
  end

  def total_revenue
    @rides.sum { |ride| ride.total_revenue }
  end

  def visitors
    @rides.reduce([]) { |acc, ride| acc.concat(ride.rider_log.keys) }.uniq
  end

  def visitor_summary
    visitors.to_h do |visitor|
      favorite_ride = @rides.max_by { |ride| ride.rider_log[visitor] }
      visitor_stats = {
        favorite_ride: favorite_ride,
        total_spent: visitor.total_spent
      }

      [visitor, visitor_stats]
    end
  end

  def ride_summary
    @rides.to_h do |ride|
      ride_stats = {
        riders: ride.rider_log.keys,
        total_revenue: ride.total_revenue
      }
      [ride, ride_stats]
    end
  end

  def summary
    {
      visitor_count: visitors.count,
      total_revenue: total_revenue,
      visitors: visitor_summary,
      rides: ride_summary
    }
  end
end
