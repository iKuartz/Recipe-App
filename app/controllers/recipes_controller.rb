class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params['recipe_id'].to_i)
  end
end
