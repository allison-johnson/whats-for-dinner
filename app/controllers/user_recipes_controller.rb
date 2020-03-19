class UserRecipesController < ApplicationController
    #add before action

    def index
      #displays a user's recipe box
      @recipes_in_box = UserRecipe.where("user_id = ?", current_user.id)
    end
    
    def create
      binding.pry 
      UserRecipe.create(user_id: params[:user_id], recipe_id: params[:recipe_id])
      redirect_to user_recipes_path
    end #create

end #class