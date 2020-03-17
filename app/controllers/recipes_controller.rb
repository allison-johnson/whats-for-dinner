class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end #index

  def new
    @recipe = Recipe.new 
    @ingredients = Ingredient.all 
    3.times do
      @recipe.recipe_ingredients.build
    end
  end #index

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new 
    end
  end #create

  def show
    set_recipe 
    @owner = @recipe.owner
    @category = Category.find_by(id: @recipe.category_id)
    @ingredients = @recipe.recipe_ingredients 
    @instructions = @recipe.instructions 
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:owner_id, :name, :category_id, :instructions, :recipe_ingredients_ids => [], :recipe_ingredients_attributes => [:ingredient_name, :quantity])
  end

end #class 