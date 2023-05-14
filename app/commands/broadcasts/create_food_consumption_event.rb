# frozen_string_literal: true
module Broadcasts
  class CreateFoodConsumptionEvent < ApplicationCommand

    def perform
      food_consumption_event
        .broadcast_append_to(
          :todays_food_edible_items,
          target: :rows,
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
