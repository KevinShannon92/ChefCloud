class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :cuisine
      t.string :media_url
      t.time :prep_time
      t.string :meal_type

      t.timestamps
    end
  end
end
