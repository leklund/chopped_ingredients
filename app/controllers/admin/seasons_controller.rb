class Admin::SeasonsController < AdminController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  # GET /admin/seasons
  # GET /admin/seasons.json
  def index
    @seasons = Season.all
  end

  # GET /admin/seasons/1
  # GET /admin/seasons/1.json
  def show
  end

  # GET /admin/seasons/new
  def new
    @season = Season.new
  end

  # GET /admin/seasons/1/edit
  def edit
  end

  # POST /admin/seasons
  # POST /admin/seasons.json
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to admin_season_url(@season), notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: admin_season_url(@season) }
      else
        format.html { render :new }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/seasons/1
  # PATCH/PUT /admin/seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to admin_season_url(@season), notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_season_url(@season) }
      else
        format.html { render :edit }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/seasons/1
  # DELETE /admin/seasons/1.json
  def destroy
    @season.destroy
    respond_to do |format|
      format.html { redirect_to admin_seasons_url, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def season_params
      params.require(:season).permit(:name, :number, :slug)
    end
end
