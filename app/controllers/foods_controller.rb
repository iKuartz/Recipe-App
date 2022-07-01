class FoodsController < ApplicationController
  def destroy
    inventory_food = InventoryFood.find(params['inventory_food_id'].to_i)
    inventory_food.destroy
    respond_to do |format|
      format.html { redirect_to show_inventory_path(inventory_id: params['inventory_id']) }
    end
  end
end
