class FormulaStepsController < ApplicationController
  before_action :set_formula_step, only: %i[ show edit update destroy ]

  # GET /formula_steps or /formula_steps.json
  def index
    @formula_steps = FormulaStep.all
  end

  # GET /formula_steps/1 or /formula_steps/1.json
  def show
  end

  # GET /formula_steps/new
  def new
    @formula_step = FormulaStep.new
  end

  # GET /formula_steps/1/edit
  def edit
  end

  # POST /formula_steps or /formula_steps.json
  def create
    @formula_step = FormulaStep.new(formula_step_params)

    respond_to do |format|
      if @formula_step.save
        format.html { redirect_to formula_step_url(@formula_step), notice: "Formula step was successfully created." }
        format.json { render :show, status: :created, location: @formula_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formula_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formula_steps/1 or /formula_steps/1.json
  def update
    respond_to do |format|
      if @formula_step.update(formula_step_params)
        format.html { redirect_to formula_step_url(@formula_step), notice: "Formula step was successfully updated." }
        format.json { render :show, status: :ok, location: @formula_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formula_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formula_steps/1 or /formula_steps/1.json
  def destroy
    @formula_step.destroy

    respond_to do |format|
      format.html { redirect_to formula_steps_url, notice: "Formula step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formula_step
      @formula_step = FormulaStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def formula_step_params
      params.require(:formula_step).permit(:name, :description, :formula_id)
    end
end
