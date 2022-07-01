class ShoppingListController < ApplicationController
  def show
    @inventory = Inventory.find_by_id(params[:inventory_food][:inventory_id])
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @foods = @recipe.foods.where_not_exists(:inventories,
                                            id: @inventory.id).select('foods.*, recipe_foods.quantity').where(recipe_foods: { recipe_id: @recipe.id })
  end
end
