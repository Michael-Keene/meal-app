# frozen_string_literal: true
module Broadcasts
  class CreateIngredient < ApplicationCommand

    def perform
      ingredient
        .broadcast_append_to(
          :ingredient_rows,
          target: :ingredient_rows_edible_rows,
          partial: 'edibles/row',
          locals: { edible: ingredient }
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
