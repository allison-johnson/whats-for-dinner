class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_recipes, class_name: "Recipe", foreign_key: :owner_id 
  has_many :user_recipes
  has_many :recipes, through: :user_recipes 
  has_many :comments 
end
