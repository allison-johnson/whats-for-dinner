class RemoveCategoryFromRecipes < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipes, :category, :string
  end
end
