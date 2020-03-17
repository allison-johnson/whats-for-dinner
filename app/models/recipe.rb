class Recipe < ApplicationRecord
    serialize :instructions, Array  

    belongs_to :owner, class_name: "User", foreign_key: :owner_id
    belongs_to :category
    
    has_many :user_recipes
    has_many :users, through: :user_recipes
    has_many :comments 

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 

    accepts_nested_attributes_for :recipe_ingredients
end