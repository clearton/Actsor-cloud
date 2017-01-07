class ThresholdsController < ApplicationController
  before_action :set_threshold, only: [:show, :edit, :update, :destroy]

  # GET /thresholds
  # GET /thresholds.json
  def index
    @thresholds = Threshold.all
  end

  # GET /thresholds/1
  # GET /thresholds/1.json
  def show
  end

  # GET /thresholds/new
  def new
    @threshold = Threshold.new
  end

  # GET /thresholds/1/edit
  def edit
  end

  # POST /thresholds
  # POST /thresholds.json
  def create
    @threshold = Threshold.new(threshold_params)

    respond_to do |format|
      if @threshold.save
        format.html { redirect_to thresholds_path, notice: 'Threshold was successfully created.' }
        format.json { render :show, status: :created, location: @threshold }
      else
        format.html { render :new }
        format.json { render json: @threshold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thresholds/1
  # PATCH/PUT /thresholds/1.json
  def update
    respond_to do |format|
      if @threshold.update(threshold_params)
        format.html { redirect_to thresholds_path, notice: 'Threshold was successfully updated.' }
        format.json { render :show, status: :ok, location: @threshold }
      else
        format.html { render :edit }
        format.json { render json: @threshold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thresholds/1
  # DELETE /thresholds/1.json
  def destroy
    @threshold.destroy
    respond_to do |format|
      format.html { redirect_to thresholds_url, notice: 'Threshold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_threshold
      @threshold = Threshold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def threshold_params
      params.require(:threshold).permit(:sensor_id, :comparing_string, :comparing_value, :status, :action)
    end
end
