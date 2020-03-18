class AddStepNumberToRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_steps, :step_number, :integer
  end
end
