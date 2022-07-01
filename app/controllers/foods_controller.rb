class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def destroy
    food = Food.find(params['food_id'].to_i)
    destroyedFood = food.destroy
    if destroyedFood.destroyed?
      respond_to do |format|
        format.redirect_to "/foods"
      end
    end
  end
end