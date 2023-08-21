class FormulaIngredientsController < ApplicationController
  before_action :set_formula_ingredient, only: %i[show edit update destroy]

  # GET /formula_ingredients or /formula_ingredients.json
  def index
    @formula_ingredients = FormulaIngredient.all
  end

  # GET /formula_ingredients/1 or /formula_ingredients/1.json
  def show
  end

  # GET /formula_ingredients/new
  def new
    @formula_ingredient = FormulaIngredient.new
  end

  # GET /formula_ingredients/1/edit
  def edit
  end

  # POST /formula_ingredients or /formula_ingredients.json
  def create
    @formula_ingredient = FormulaIngredient.new(formula_ingredient_params)

    respond_to do |format|
      if @formula_ingredient.save
        format.html { redirect_to formula_ingredient_url(@formula_ingredient), notice: "Formula ingredient was successfully created." }
        format.json { render :show, status: :created, location: @formula_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formula_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formula_ingredients/1 or /formula_ingredients/1.json
  def update
    respond_to do |format|
      if @formula_ingredient.update(formula_ingredient_params)
        format.html { redirect_to formula_ingredient_url(@formula_ingredient), notice: "Formula ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @formula_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formula_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formula_ingredients/1 or /formula_ingredients/1.json
  def destroy
    @formula_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to formula_ingredients_url, notice: "Formula ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_formula_ingredient
    @formula_ingredient = FormulaIngredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def formula_ingredient_params
    params.require(:formula_ingredient).permit(:ingredient_id, :percentage, :decimal, :formula_id)
  end
end
