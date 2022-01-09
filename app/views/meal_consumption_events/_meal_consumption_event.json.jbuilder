json.extract! meal_consumption_event, :id, :user_id, :meal_id, :created_at, :updated_at
json.url meal_consumption_event_url(meal_consumption_event, format: :json)
