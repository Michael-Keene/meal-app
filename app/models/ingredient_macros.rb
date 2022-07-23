# frozen_string_literal: true
class IngredientMacros < ApplicationRecord

  self.primary_key = :ingredient_id

  belongs_to :ingredient

  def readonly?
    true
  end

end
