class ChangePrimaryIngredientToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :primary_ingredient, :category 
  end
end
