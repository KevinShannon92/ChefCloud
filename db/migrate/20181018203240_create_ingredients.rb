class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.text :description
      t.string :ing_type

      t.timestamps
    end
  end
end
