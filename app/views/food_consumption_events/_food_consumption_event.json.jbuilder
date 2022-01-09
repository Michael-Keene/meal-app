json.extract! food_consumption_event, :id, :user_id, :food_id, :grams, :created_at, :updated_at
json.url food_consumption_event_url(food_consumption_event, format: :json)
