class DailyLogController < ApplicationController
  def index
    @todays_meals = current_user.todays_meals
    @todays_food = current_user.todays_food
    @meal_totals = Totals::MakeTotalFromCollection.perform(@todays_meals, :meal)
    @food_totals = Totals::MakeTotalFromCollection.perform(@todays_food, :food)
  end
end
