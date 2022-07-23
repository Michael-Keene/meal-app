# frozen_string_literal: true
class DailyLogController < ApplicationController

  def index
    @todays_meals = current_user.todays_meals
    @todays_food = current_user.todays_food
    @meal_totals = Totals::MakeTotalFromCollection.perform(collection: @todays_meals, total_type: :meal,
                                                           user: current_user)
    @food_totals = Totals::MakeTotalFromCollection.perform(collection: @todays_food, total_type: :food,
                                                           user: current_user)
    @current_user = current_user
  end

end
