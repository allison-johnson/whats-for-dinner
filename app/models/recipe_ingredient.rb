class RecipeIngredient < ApplicationRecord
  belongs_to :recipe 
  belongs_to :ingredient 

  validates :ingredient_id, presence: true
  validates :quantity, presence: true

  #Return the ingredient name associated with a recipe_ingredient
  def ingredient_name
    if self.ingredient 
      self.ingredient.name 
    else
      nil 
    end
  end

end 