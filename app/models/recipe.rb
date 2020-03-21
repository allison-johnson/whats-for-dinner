class Recipe < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: :owner_id
    belongs_to :category
    
    has_many :user_recipes
    has_many :users, through: :user_recipes
    #has_many :comments 

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 

    has_many :recipe_steps 

    validates :owner_id, :name, :category_id, presence: true 
    validates :num_steps, numericality: {only_integer: true, greater_than: 0} 
    validates :num_ingredients, numericality: {only_integer: true, greater_than: 0} 

    #scope :by_owner, -> (owner_id) { where("owner_id = ?", owner_id)}
    scope :by_category, -> (category_id) { where("category_id = ?", category_id)}


    def recipe_ingredients_attributes=(ri_hash)
        ri_hash.each do |index, ri_info|
            if !ri_info[:ingredient_name].empty?
              ingredient = Ingredient.find_or_create_by(name: ri_info[:ingredient_name].downcase)
              r = RecipeIngredient.create(quantity: ri_info[:quantity], recipe_id: self.id, ingredient_id: ingredient.id)
              #binding.pry 
              self.recipe_ingredients << r 
            end
        end
        self.save 
    end

    def recipe_steps_attributes=(rs_hash)
        rs_hash.each do |index, rs_info|
            if rs_info[:content] != ""
                recipe_step = RecipeStep.create(content: rs_info[:content], recipe_id: self.id, step_number: index.to_i + 1)
                self.recipe_steps << recipe_step
            end
        end
        self.save 
    end

    def num_saves
      UserRecipe.where("recipe_id = ?", self.id).count 
    end

    # def self.by_owner(owner_id)
    #   where("owner_id = ?", owner_id)
    # end

    # def self.by_category(category)
    #   where("category_id = ?", category.id)
    # end

end