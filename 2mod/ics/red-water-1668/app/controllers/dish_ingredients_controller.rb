class DishIngredientsController < ApplicationController
  def create
    dish_ingredient = DishIngredient.create(dish_id: params[:dish_ID], ingredient_id: params[:ingredient_ID])
    redirect_to dish_path(dish_ingredient.dish)
  end
end
