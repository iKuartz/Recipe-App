class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false
      t.decimal :price, null: false
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
