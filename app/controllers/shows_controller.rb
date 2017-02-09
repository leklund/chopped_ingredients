class ShowsController < ApplicationController
  def index
    @seasons = Season.all.order(:sort).includes(:shows)
  end

  def show
    @show = Show.find_by(slug: params[:slug])
  end
end
