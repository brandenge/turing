class Bag
  attr_reader :candies

  def initialize
    @candies = []
  end

  def empty?
    @candies.empty?
  end

  def count
    @candies.count
  end

  def <<(candy)
    @candies << candy
  end

  def contains?(type)
    @candies.map{ |candy| candy.type }.include?(type)
  end

  def grab(candy_name)
    index = @candies.map{ |candy| candy.type  }.index(candy_name)
    @candies.delete_at(index)
  end

  def take(n)
    n == 1 ? @candies.pop(n).first : @candies.pop(n)
  end
end
