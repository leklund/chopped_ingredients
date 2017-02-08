class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all_with_stats
  end

  def show
    @ingredient = Ingredient.find params[:id]
  end
end
