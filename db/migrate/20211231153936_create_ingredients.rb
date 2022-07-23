# frozen_string_literal: true
class CreateIngredients < ActiveRecord::Migration[7.0]

  def change
    create_table :ingredients do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.float :grams

      t.timestamps
    end
  end

end
