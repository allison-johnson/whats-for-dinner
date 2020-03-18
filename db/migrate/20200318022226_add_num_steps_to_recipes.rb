class AddNumStepsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :num_steps, :integer
  end
end
