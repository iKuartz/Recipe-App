class ChangePriceToBeIntegerInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :integer, :default => 0
  end
end
