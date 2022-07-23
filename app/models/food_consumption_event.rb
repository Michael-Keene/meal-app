# frozen_string_literal: true
class FoodConsumptionEvent < ApplicationRecord

  include Edible
  include Consumable

  belongs_to :user
  belongs_to :food

  %i[fat fibre carbs protein calories].each do |macro|
    define_method(macro) do
      food.send(macro) * (grams / 100.0)
    end
  end

end
