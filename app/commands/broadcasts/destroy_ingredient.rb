module Broadcasts
  class DestroyIngredient < ApplicationCommand

    def perform
      ingredient.broadcast_remove_to(
        :ingredient_rows
      )
      meal_consumption_events.each do |mce|
        Broadcasts::UpdateMealConsumptionEvent.perform(meal_consumption_event: mce)
      end
    end

    private

    attr_reader :ingredient

    def initialize(ingredient:)
      @ingredient = ingredient
    end

    def meal_consumption_events
      MealConsumptionEvent.where(meal: ingredient.meal)
    end

  end
end
