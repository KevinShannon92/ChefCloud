json.extract! ingredient, :id, :title, :description, :ing_type, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
