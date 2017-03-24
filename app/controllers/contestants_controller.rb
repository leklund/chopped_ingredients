class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.order(:slug).all.includes(:shows)
  end

  def show
    @contestant = Contestant.find_by(slug: params[:slug])
  end
end
