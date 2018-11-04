json.extract! recipe, :id, :title, :description, :cuisine, :media_url, :prep_time, :meal_type, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
