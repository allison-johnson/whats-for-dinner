class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :primary_ingredient
      t.text :ingredients
      t.text :instructions
    end
  end
end
