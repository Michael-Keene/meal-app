# frozen_string_literal: true
module SearchEntryHelper
  def food_item_create_url(searchable, parent_item)
    case parent_item
    when Meal
      meal_ingredients_url(parent_item, action: :create)
    when User
      user_result_to_url(searchable, parent_item)
    end
  end

  def user_result_to_url(searchable, _user)
    case searchable
    when Food
      food_consumption_events_url
    when Meal
      meal_consumption_events_url
    end
  end
end
