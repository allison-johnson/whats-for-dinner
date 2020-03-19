class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_recipes, class_name: "Recipe", foreign_key: :owner_id 
  has_many :user_recipes
  has_many :recipes, through: :user_recipes 
  has_many :comments 

  def saved_recipes
    user_recipes = UserRecipe.where("user_id = ?", self.id)
    user_recipes.collect{|user_recipe| Recipe.find_by(id: user_recipe.recipe_id)}
  end

end
