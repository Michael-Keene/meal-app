# frozen_string_literal: true
class CreateIngredientMacros < ActiveRecord::Migration[7.0]

  def change
    create_view :ingredient_macros
  end

end
