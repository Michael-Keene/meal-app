module SearchEntryHelper

  def create_url(searchable, parent_item)
    case parent_item
    when Meal
      meal_ingredients_url(parent_item, action: :post)
    when User
      user_result_to_url(searchable, parent_item)
    end
  end

  def user_result_to_url(searchable, user)
    case searchable
    when Food
      food_consumption_event_url(action: :post)
    when Meal
      meal_consumption_event_url(action: :post)
    end
  end

end
