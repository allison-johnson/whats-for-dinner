class AddOwnerIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :owner_id, :integer
  end
end
