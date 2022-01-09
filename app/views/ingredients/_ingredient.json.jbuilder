json.extract! ingredient, :id, :meal_id, :food_id, :grams, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
