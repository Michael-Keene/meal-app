class DailyLogController < ApplicationController
  def index
    @todays_meals = current_user.todays_meals
    @todays_food = current_user.todays_food
  end
end
