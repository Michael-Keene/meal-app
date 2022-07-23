# frozen_string_literal: true
module Broadcasts
  class UpdateMealConsumptionEvent < ApplicationCommand

    def perform
      meal_consumption_event
        .broadcast_replace_to(
          :todays_meals,
          target: meal_consumption_event,
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
