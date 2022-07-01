class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.where(user:current_user)
  end

  def show
    @inventory = Inventory.find(params[:inventory_id].to_i)
  end
end
