class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all_with_stats
  end

  def show
    @ingredient = Ingredient.find_by(slug: params[:slug])
    @shows = Show.for_ingredient(@ingredient.id)
  end
end
