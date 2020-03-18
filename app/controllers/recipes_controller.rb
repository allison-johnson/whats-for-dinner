class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @recipes = Recipe.all
  end #index

  def new
    #binding.pry 
    if is_integer_greater_than_zero(params[:num_ingredients].to_i) && is_integer_greater_than_zero(params[:num_steps].to_i)
      @recipe = Recipe.new 
      #@ingredients = Ingredient.all 
      
      @num_ingredients = params[:num_ingredients].to_i + 2
      @num_ingredients.times do
        @recipe.recipe_ingredients.build
      end #do

      @num_steps = params[:num_steps].to_i + 2
      @num_steps.times do
        @recipe.recipe_steps.build 
      end #do
      
    else
      flash[:message] = "Please fill in both fields with a whole number greater than 0."
      render :setup
    end
  end #index

  def create
    @recipe = Recipe.new(recipe_params)
    #binding.pry

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      #binding.pry 
      @num_steps = @recipe.num_steps 
      (@num_steps - @recipe.recipe_steps.size).times do 
        @recipe.recipe_steps.build 
      end #do

      @num_ingredients = @recipe.num_ingredients 
      (@num_ingredients - @recipe.recipe_ingredients.size).times do
        @recipe.recipe_ingredients.build
      end #do
      render :new 
    end
  end #create

  def show
    set_recipe 
    @owner = @recipe.owner
    @category = Category.find_by(id: @recipe.category_id)
    @ingredients = @recipe.recipe_ingredients 
    @steps = @recipe.recipe_steps
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:owner_id, :name, :category_id, :num_steps, :num_ingredients, :instructions, :recipe_ingredients_ids => [], :recipe_ingredients_attributes => [:ingredient_name, :quantity], :recipe_step_ids => [], :recipe_steps_attributes => [:content, :step_number])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to new_user_session_path 
    end
  end

  def is_integer_greater_than_zero(arg)
    arg > 0
  end

end #class 