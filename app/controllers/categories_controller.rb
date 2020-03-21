class CategoriesController < ApplicationController 

  def index
    @categories = Category.all 
  end #index

  # def new
  # end #new

end #class 