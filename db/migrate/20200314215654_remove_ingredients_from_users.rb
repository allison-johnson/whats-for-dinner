class RemoveIngredientsFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :ingredients, :text
  end
end
