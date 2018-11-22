class AddColumnsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cook_time, :time
    add_column :recipes, :servings, :integer
    add_column :recipes, :rating, :decimal
    add_column :recipes, :favourite, :boolean
    add_column :recipes, :available, :boolean
    add_column :recipes, :cooking_method, :string
    add_column :recipes, :instructions, :text
    add_column :recipes, :cost, :decimal
  end
end
