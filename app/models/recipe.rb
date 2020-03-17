class Recipe < ApplicationRecord
    serialize :instructions, Array  

    belongs_to :owner, class_name: "User", foreign_key: :owner_id
    belongs_to :category
    
    has_many :user_recipes
    has_many :users, through: :user_recipes
    has_many :comments 

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 

    #accepts_nested_attributes_for :recipe_ingredients

    def recipe_ingredients_attributes=(ri_hash)
        ri_hash.each do |index, ri_info|
            if ri_info[:ingredient_name] != ""
              ingredient = Ingredient.find_or_create_by(name: ri_info[:ingredient_name].downcase)
              r = RecipeIngredient.create(quantity: ri_info[:quantity], recipe_id: self.id, ingredient_id: ingredient.id)
              self.recipe_ingredients << r 
            end
        end
        self.save 
    end

end