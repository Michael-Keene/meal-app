class MealConsumptionEvent < ApplicationRecord
  include Edible
  include Consumable

  belongs_to :user
  belongs_to :meal

end
