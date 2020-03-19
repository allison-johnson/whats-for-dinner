class UserRecipe < ApplicationRecord
  belongs_to :user 
  belongs_to :recipe 

  def recipe_name
    Recipe.find_by(id: self.recipe_id).name 
  end

end 