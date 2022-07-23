# frozen_string_literal: true
module Broadcasts
  class UpdateFoodConsumptionEvent < ApplicationCommand

    def perform
      food_consumption_event
        .broadcast_replace_to(
          :todays_food,
          target: food_consumption_event,
          partial: 'edibles/row',
          locals: { edible: food_consumption_event }
        )
      Broadcasts::UpdateTodaysFood.perform(user: food_consumption_event.user)
    end

    private

    attr_reader :food_consumption_event

    def initialize(food_consumption_event:)
      @food_consumption_event = food_consumption_event
    end

  end
end
