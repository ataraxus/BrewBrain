class FormulaCategoriesController < ApplicationController
  before_action :set_formula_category, only: %i[ show edit update destroy ]

  # GET /formula_categories or /formula_categories.json
  def index
    @formula_categories = FormulaCategory.all
  end

  # GET /formula_categories/1 or /formula_categories/1.json
  def show
  end

  # GET /formula_categories/new
  def new
    @formula_category = FormulaCategory.new
  end

  # GET /formula_categories/1/edit
  def edit
  end

  # POST /formula_categories or /formula_categories.json
  def create
    @formula_category = FormulaCategory.new(formula_category_params)

    respond_to do |format|
      if @formula_category.save
        format.html { redirect_to formula_category_url(@formula_category), notice: "Formula category was successfully created." }
        format.json { render :show, status: :created, location: @formula_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formula_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formula_categories/1 or /formula_categories/1.json
  def update
    respond_to do |format|
      if @formula_category.update(formula_category_params)
        format.html { redirect_to formula_category_url(@formula_category), notice: "Formula category was successfully updated." }
        format.json { render :show, status: :ok, location: @formula_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formula_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formula_categories/1 or /formula_categories/1.json
  def destroy
    @formula_category.destroy

    respond_to do |format|
      format.html { redirect_to formula_categories_url, notice: "Formula category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formula_category
      @formula_category = FormulaCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formula_category_params
      params.require(:formula_category).permit(:name, :description)
    end
end
