class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
      # this allows things like @recipes = Recipe.using("onion")
  scope :using, (lambda do |text| 
    joins(:ingredients).where("ingredients.title LIKE ?", "%#{text}%")
  end)
end
