class FoodConsumptionEvent < ApplicationRecord
  include Edible
  include Consumable

  belongs_to :user
  belongs_to :food
end
