class AddNumIngredientsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :num_ingredients, :integer
  end
end
