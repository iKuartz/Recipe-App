class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.where(user: current_user)
  end

  def show
    @inventory = Inventory.find(params[:inventory_id].to_i)
  end

  def destroy
    inventory = Inventory.find(params['inventory_id'].to_i)
    inventory.destroy
    respond_to do |format|
      format.html { redirect_to '/inventories' }
    end
  end
end
