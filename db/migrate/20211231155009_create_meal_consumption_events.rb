# frozen_string_literal: true
class CreateMealConsumptionEvents < ActiveRecord::Migration[7.0]

  def change
    create_table :meal_consumption_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end

end
