class Ingredient < ApplicationRecord

  include Edible
  belongs_to :meal
  belongs_to :food

  has_one :macros, class_name: "IngredientMacros"

  scope :with_food, ->(food) { where(food: food) }

end
