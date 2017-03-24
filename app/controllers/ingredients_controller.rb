class IngredientsController < ApplicationController
  def index
    if params[:search]
      @ingredients = Ingredient.search(params[:search])
    else
      @ingredients = Ingredient.all_with_stats
    end
  end

  def show
    @ingredient = Ingredient.find_by(slug: params[:slug])
    @shows = Show.for_ingredient(@ingredient.id)
  end
end
