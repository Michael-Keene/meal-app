# frozen_string_literal: true
class MealConsumptionEvent < ApplicationRecord

  include Edible
  include Consumable

  belongs_to :user
  belongs_to :meal

  delegate :fat,
           :fibre,
           :carbs,
           :protein,
           :calories,
           to: :meal

end
