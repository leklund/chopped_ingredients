class Admin::ShowsController < AdminController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  # GET /admin/shows
  # GET /admin/shows.json
  def index
    @shows = Show.all
  end

  # GET /admin/shows/1
  # GET /admin/shows/1.json
  def show
  end

  # GET /admin/shows/new
  def new
    @show = Show.new
  end

  # GET /admin/shows/1/edit
  def edit
  end

  # POST /admin/shows
  # POST /admin/shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to admin_show_url(@show), notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: admin_show_url(@show) }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/shows/1
  # PATCH/PUT /admin/shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to admin_show_url(@show), notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_show_url(@show) }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shows/1
  # DELETE /admin/shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to admin_shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:title, :date, :notes, :series_num, :season_id)
    end
end
