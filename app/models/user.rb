class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :owned_recipes, class_name: "Recipe", foreign_key: :owner_id 
  has_many :user_recipes
  has_many :recipes, through: :user_recipes 
  has_many :comments 

  def saved_recipes
    user_recipes = UserRecipe.where("user_id = ?", self.id)
    user_recipes.collect{|user_recipe| Recipe.find_by(id: user_recipe.recipe_id)}
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    # unless user 
    #   user = User.create( 
    #     email: data['email'],
    #     password: Devise.friendly_token[0,20]
    #   )
    # end
    user 
  end #self.from_ommniauth

end
