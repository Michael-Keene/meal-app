# frozen_string_literal: true
class CreateFoodConsumptionEvents < ActiveRecord::Migration[7.0]

  def change
    create_table :food_consumption_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.float :grams

      t.timestamps
    end
  end

end
