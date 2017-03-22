class JudgesController < ApplicationController
  def index
    @judges = Judge.all_by_appearances
  end

  def show
    @judge = Judge.find_by(slug: params[:slug])
  end
end
