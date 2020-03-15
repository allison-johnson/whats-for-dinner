class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end #index

  def new
    @recipe = Recipe.new 
  end #index

  def create

  end #create

  def show
    set_recipe 
    @owner = @recipe.owner
    @ingredients = @recipe.recipe_ingredients 
    @instructions = @recipe.instructions 
    #binding.pry 
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).perimt(:owner_id, :name, :category, :instructions)
  end

end #class 