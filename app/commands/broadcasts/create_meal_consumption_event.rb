# frozen_string_literal: true
module Broadcasts
  class CreateMealConsumptionEvent < ApplicationCommand

    def perform
      meal_consumption_event
        .broadcast_append_to(
          :todays_meals,
          target: :todays_meals_edible_rows,
          partial: 'edibles/row',
          locals: {
            edible: meal_consumption_event,
            no_quantity: true
          }
        )
      Broadcasts::UpdateTodaysMeals.perform(user: meal_consumption_event.user)
    end

    private

    attr_reader :meal_consumption_event

    def initialize(meal_consumption_event:)
      @meal_consumption_event = meal_consumption_event
    end

  end
end
