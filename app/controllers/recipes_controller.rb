class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end #index

  def new
    if params[:num_ingredients].nil? || params[:num_steps].nil? 
      render :setup 
    else
      if params[:num_ingredients].empty? || params[:num_steps].empty?
        flash[:message] = "Please fill in all required fields."
        render :setup
      else
        @recipe = Recipe.new 
        @ingredients = Ingredient.all 
        @num_steps = params[:num_steps].to_i + 2
        (params[:num_ingredients].to_i + 2).to_i.times do
          @recipe.recipe_ingredients.build
        end #do
      end
    end #outer if/else
  end #index

  def create
    binding.pry
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