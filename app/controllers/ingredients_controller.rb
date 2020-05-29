class IngredientsController < ApplicationController

  def index
    # binding.pry
    @ingredients = Chef.find(params[:chef_id]).recipes
  end
  
end