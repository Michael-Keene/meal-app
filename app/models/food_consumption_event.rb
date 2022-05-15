class FoodConsumptionEvent < ApplicationRecord
  include Edible
  include Consumable

  belongs_to :user
  belongs_to :food

  [:fat, :fibre, :carbs, :protein, :calories].each do |macro|
    define_method(macro) do
      food.send(macro) * (grams/100.0)
    end
  end
end
