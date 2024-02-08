class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  validates :calories, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :dish_ingredients
  has_many :dishes, -> { distinct }, through: :dish_ingredients
  has_many :chefs, -> { distinct }, through: :dishes
end
