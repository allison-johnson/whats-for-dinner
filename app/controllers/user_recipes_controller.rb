class UserRecipesController < ApplicationController
    before_action :require_login, only: [:index, :create]

    def index
      #displays a user's recipe box
      @recipes_in_box = UserRecipe.where("user_id = ?", current_user.id)
    end
    
    def create
      UserRecipe.create(user_id: params[:user_id], recipe_id: params[:recipe_id])
      redirect_to user_recipes_path
    end #create

    private

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this page."
        redirect_to new_user_session_path 
      end
    end

end #class