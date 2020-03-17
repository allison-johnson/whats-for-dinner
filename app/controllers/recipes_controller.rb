class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end #index

  def new
    @recipe = Recipe.new 
    3.times do
      @recipe.ingredients.build 
    end
  end #index

  def create
    binding.pry 
    @recipe = Recipe.new
    @recipe.owner_id = params[:recipe][:owner_id]
    @recipe.name = params[:recipe][:name]
    @recipe.category_id = params[:recipe][:category_id]
    @recipe.save

    #Create a record in recipe_ingredients table for each ingredient selected
    #Use the recipe_id that was just created upon save
    params[:recipe][:ingredient_ids].each do |id|
      if id.to_i > 0
        @recipe.recipe_ingredients << RecipeIngredient.create(quantity: "1 cup", ingredient_id: id)
      end
    end

    @recipe.save 
    
    #Create records in recipe_ingredients from existing ingredients
    # params[:recipe][:ingredient_ids].each do |id|
    #   if id.to_i > 0
    #     RecipeIngredient.create(quantity: "1 cup", ingredient_id: id, recipe_id: @recipe.id)
    #     @recipe.ingredients << Ingredient.find(id)
    #   end
    # end

    # @recipe.save 
    # binding.pry 
    #Create records in recipe_ingredients from new ingredients 
    #params[:recipe][:ingredients].each 


    redirect_to recipe_path(@recipe)
  end #create

  def show
    set_recipe 
    @owner = @recipe.owner
    @category = Category.find_by(id: @recipe.category_id)
    @ingredients = @recipe.recipe_ingredients 
    @instructions = @recipe.instructions 
    #binding.pry 
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:owner_id, :name, :category_id, :instructions, :recipe_ingredients_ids => [], :recipe_ingredients_attributes => [:ingredient_id])
  end

end #class 