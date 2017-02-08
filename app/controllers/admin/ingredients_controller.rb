class Admin::IngredientsController < AdminController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /admin/ingredients
  # GET /admin/ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /admin/ingredients/1
  # GET /admin/ingredients/1.json
  def show
  end

  # GET /admin/ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /admin/ingredients/1/edit
  def edit
  end

  # POST /admin/ingredients
  # POST /admin/ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to admin_ingredient_url(@ingredient), notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: admin_ingredient_url(@ingredient) }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ingredients/1
  # PATCH/PUT /admin/ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to admin_ingredient_url(@ingredient), notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_ingredient_url(@ingredient) }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ingredients/1
  # DELETE /admin/ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to admin_ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :slug)
    end
end
