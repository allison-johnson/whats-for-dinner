class UserRecipesController < ApplicationController
    before_action :require_login, only: [:index, :create]

    def index
      #displays a user's recipe box
      @recipes_in_box = UserRecipe.where("user_id = ?", current_user.id)
    end
    
    def create
      if !current_user.saved_recipes.include?(Recipe.find_by(id: params[:recipe_id]))
        UserRecipe.create(user_id: params[:user_id], recipe_id: params[:recipe_id])
      end
      redirect_to user_recipes_path
    end #create

    def destroy
      binding.pry 
      UserRecipe.find_by(user_id: params[:user_id], recipe_id: params[:recipe_id]).destroy
      redirect_to user_recipes_path 
    end #destroy

    private

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this page."
        redirect_to new_user_session_path 
      end
    end

end #class