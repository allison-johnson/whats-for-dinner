class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients 

  before_validation :make_lower

  validates :name, presence: true
  validates :name, uniqueness: true 

  def make_lower
    self.name = self.name.downcase 
  end
end 