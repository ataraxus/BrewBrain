class BatchStepsController < ApplicationController
  before_action :set_batch_step, only: %i[ show edit update destroy ]

  # GET /batch_steps or /batch_steps.json
  def index
    @batch_steps = BatchStep.all
  end

  # GET /batch_steps/1 or /batch_steps/1.json
  def show
  end

  # GET /batch_steps/new
  def new
    @batch_step = BatchStep.new
  end

  # GET /batch_steps/1/edit
  def edit
  end

  # POST /batch_steps or /batch_steps.json
  def create
    @batch_step = BatchStep.new(batch_step_params)

    respond_to do |format|
      if @batch_step.save
        format.html { redirect_to batch_step_url(@batch_step), notice: "Batch step was successfully created." }
        format.json { render :show, status: :created, location: @batch_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_steps/1 or /batch_steps/1.json
  def update
    respond_to do |format|
      if @batch_step.update(batch_step_params)
        format.html { redirect_to batch_step_url(@batch_step), notice: "Batch step was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_steps/1 or /batch_steps/1.json
  def destroy
    @batch_step.destroy

    respond_to do |format|
      format.html { redirect_to batch_steps_url, notice: "Batch step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_step
      @batch_step = BatchStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_step_params
      params.require(:batch_step).permit(:name, :description, :resource_id, :batch_id)
    end
end
