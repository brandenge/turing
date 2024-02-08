class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.filter{ |dish| dish.category == category }
  end

  def menu
    categories = @dishes.map{ |dish| dish.category }.uniq
    categories.to_h do |category|
      dishes_by_cat = get_all_from_category(category).map{ |dish| dish.name }
      ["#{category}s".to_sym, dishes_by_cat.sort]
    end
  end

  def ratio(category)
    (get_all_from_category(category).count.fdiv(@dishes.count) * 100).round(1)
  end
end
