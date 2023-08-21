class ExecutedStepsController < ApplicationController
  before_action :set_executed_step, only: %i[ show edit update destroy ]

  # GET /executed_steps or /executed_steps.json
  def index
    @executed_steps = ExecutedStep.all
  end

  # GET /executed_steps/1 or /executed_steps/1.json
  def show
  end

  # GET /executed_steps/new
  def new
    @executed_step = ExecutedStep.new
  end

  # GET /executed_steps/1/edit
  def edit
  end

  # POST /executed_steps or /executed_steps.json
  def create
    @executed_step = ExecutedStep.new(executed_step_params)

    respond_to do |format|
      if @executed_step.save
        format.html { redirect_to executed_step_url(@executed_step), notice: "Executed step was successfully created." }
        format.json { render :show, status: :created, location: @executed_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @executed_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executed_steps/1 or /executed_steps/1.json
  def update
    respond_to do |format|
      if @executed_step.update(executed_step_params)
        format.html { redirect_to executed_step_url(@executed_step), notice: "Executed step was successfully updated." }
        format.json { render :show, status: :ok, location: @executed_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @executed_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executed_steps/1 or /executed_steps/1.json
  def destroy
    @executed_step.destroy

    respond_to do |format|
      format.html { redirect_to executed_steps_url, notice: "Executed step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_executed_step
      @executed_step = ExecutedStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def executed_step_params
      params.require(:executed_step).permit(:name, :state, :executed_at, :user_id, :batch_id, :process_step_id)
    end
end
