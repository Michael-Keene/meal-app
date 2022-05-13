class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meal_consumption_events
  has_many :food_consumption_events

  has_many :todays_meals, -> { consumed_on(DateTime.current) }, class_name: "MealConsumptionEvent"
  has_many :todays_food, -> { consumed_on(DateTime.current) }, class_name: "FoodConsumptionEvent"

  def targets
    attributes.symbolize_keys.slice(:fat, :carbs, :protein, :fibre, :calories)
  end
end
