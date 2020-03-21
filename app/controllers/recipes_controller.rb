class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit]

  def index
    flash[:has_user] = false
    flash[:has_category] = false

    if params[:category_id]
      flash[:has_category] = true
      @category = Category.find(params[:category_id])
      #Account for case where category does not exist
      @categories = Category.all 
      @recipes = Recipe.all.where("category_id = ?", @category.id)

    else
    #Turn all of this into the else
      if params[:user_id] #index route nested under users
        flash[:has_user] = true 
        @user = User.find_by(id: params[:user_id])
        if @user.nil?
          flash[:alert] = "User not found!"
          redirect_to root_path
        else
          @recipes = @user.owned_recipes 
          @categories = Category.all
        end
      else #non-nested index route
        @recipes = Recipe.all
        @categories = Category.all

        if !params[:category].blank?
          @recipes = @recipes.by_category(params[:category].to_i)
        end

      end
    end
  end #index

  def new
    flash[:has_category] = false

    if params[:category_id]
      flash[:has_category] = true
      @category_id = params[:category_id].to_i 
      get_new_recipe(@category_id) 

    else
      if params[:user_id]
        #binding.pry 
        if current_user.id == params[:user_id].to_i
          get_new_recipe
        else
          flash[:alert] = "Not authorized to create a recipe for this user!"
          redirect_to root_path 
        end
      else
        get_new_recipe 
      end
    end 
  end #new

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
  end #show

  def search
    #binding.pry 
    if params[:query].blank?
      flash[:alert] = "Empty search field!"
      redirect_to recipes_path 
    else
      @recipes = Recipe.search(params[:query].downcase)
      @categories = Category.all
      render :index 
      #binding.pry 
      #pass @recipes to a form partial used by recipes#index
    end #if
  end #search 

  def edit
    set_recipe 

    if @recipe.owner_id == current_user.id 

      @num_steps = @recipe.num_steps 
      (@num_steps - @recipe.recipe_steps.size).times do 
        @recipe.recipe_steps.build 
      end #do

      @num_ingredients = @recipe.num_ingredients 
      (@num_ingredients - @recipe.recipe_ingredients.size).times do
        @recipe.recipe_ingredients.build
      end #do

    else
      render 'home/index'
    end

  end #edit

  def update
    set_recipe 
    @recipe.recipe_ingredients.clear
    @recipe.recipe_steps.clear
    @recipe.save

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe) 
    else
      @num_steps = @recipe.num_steps 
      (@num_steps - @recipe.recipe_steps.size).times do 
        @recipe.recipe_steps.build 
      end #do

      @num_ingredients = @recipe.num_ingredients 
      (@num_ingredients - @recipe.recipe_ingredients.size).times do
        @recipe.recipe_ingredients.build
      end #do
      render ':edit'
    end #if
  end #update

  def destroy
    set_recipe

    # It feels like when a recipe gets destroyed, the records in the join
    # table that include that recipe should automatically get destroyed as well...
    # But I don't think that happens, so I'll destroy them first

    UserRecipe.where("recipe_id = ?", @recipe.id).each do |ur_record|
      ur_record.destroy
    end

    @recipe.destroy

    redirect_to root_path 
  end #destroy 

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

  def get_new_recipe(category_id = 0)
    flash[:has_category] = false
    @category_id = category_id.to_i  
    if is_integer_greater_than_zero(params[:num_ingredients].to_i) && is_integer_greater_than_zero(params[:num_steps].to_i)
      @recipe = Recipe.new 
      
      if @category_id > 0
        flash[:has_category] = true
        @category = Category.find_by(id: @category_id)
      end
      
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
  end

end #class 