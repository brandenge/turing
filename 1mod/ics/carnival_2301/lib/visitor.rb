class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences,
              :total_spent

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.gsub(/[^0-9]/, '').to_i
    @preferences = []
    @total_spent = 0
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(min_height)
    @height >= min_height
  end

  def pay_admission_fee(admission_fee)
    @total_spent += admission_fee
    @spending_money -= admission_fee
  end
end
