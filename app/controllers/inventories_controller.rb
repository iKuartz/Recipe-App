class InventoriesController < ApplicationController
  def index
    @user = current_user
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @inventory = current_user.inventories.find(params[:id])
  end

  def create
    @user = current_user
    @inventory = Inventory.new(inventory_params)
    @inventory.user = @user

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: 'inventory was successfully created.' }
        format.json { render :index, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_path, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description, :user_id)
  end
end
