class CreateRecipeStep < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_steps do |t|
      t.text :content
    end
  end
end
