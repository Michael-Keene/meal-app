class CreateShoppingMealAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_meal_associations do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
