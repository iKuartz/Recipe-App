class RecipesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show
    @recipe = Recipe.find(params['recipe_id'].to_i)
    @recipe_foods = RecipeFood.where(recipe_id: params['recipe_id'].to_i)
    @foods = Food.all
    @food_options = []
    @foods.each do |food|
      @food_options << [food.name, food.id]
    end
    @user = current_user
  end

  def remove_ingredient
    @ingredient = RecipeFood.find(params[:ingredient_id].to_i)
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to "/recipes/#{params[:recipe_id].to_i}" }
      format.json { head :no_content }
    end
  end

  def update_quantity
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.quantity = recipe_params['quantity'].to_i
    @recipe_food.save
    respond_to do |format|
      format.html { redirect_to "/recipes/#{params[:recipe_id].to_i}" }
      format.json { head :no_content }
    end
  end

  def add
    recipe_food = RecipeFood.create(quantity: food_params['quantity'], recipe_id: params['recipe_id'].to_i,
                                    food_id: food_params['foods'].to_i)
    return if recipe_food.new_record?

    respond_to do |format|
      format.html { redirect_to "/recipes/#{params[:recipe_id]}" }
      format.json { head :no_content }
    end
  end

  def update
    recipe = Recipe.find(params['recipe_id'].to_i)
    recipe.public = !recipe_access_params[:public].to_i.zero?
    return unless recipe.save

    respond_to do |format|
      format.html { redirect_to "/recipes/#{params[:recipe_id]}" }
      format.json { head :no_content }
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_url, notice: 'Recipe was successfully created.'
        else
          render :new, alert: 'Recipe could not be created'
        end
      end
    end
  end

  def destroy
    recipe = Recipe.find(params['recipe_id'].to_i)
    recipe_foods = RecipeFood.where(recipe_id: params[:recipe_id].to_i)
    recipe_foods.delete_all
    destroyed_recipe = recipe.destroy
    if destroyed_recipe.destroyed?
      respond_to do |format|
        format.html { redirect_to '/recipes/' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/recipes/#{params[:recipe_id]}" }
        format.json { head :no_content }
      end
    end
  end

  private

  def recipe_access_params
    params.require(:access).permit(:public)
  end

  def food_params
    params.require(:selected_food).permit(:foods, :quantity)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :quantity)
  end
end
