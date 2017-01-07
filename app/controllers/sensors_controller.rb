class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  # GET /sensors
  # GET /sensors.json
  def index
    @q = Sensor.ransack(params[:q])
    @sensors = @q.result.order('name asc')
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payload
    @sensor = Sensor.find(params[:id])
    # temporal, just removing the last part of the values
    all_values = "Dynamodb::#{@sensor.dynamodb_table}".constantize.range(@sensor.ball.name, (Time.now - 12.hours), Time.now) || []
    if params[:kalman]
      @values =  Kalman.new(all_values,@sensor.name).filtered_values
    else
      @values = all_values
    end
  end

  def plot
    @sensor = Sensor.find(params[:id])
    @r = params[:r] || 0.1**2
    @q = params[:q] || 1e-5
    @from = params[:from] || (DateTime.now - 12.hours).strftime("%Y-%m-%dT%H:%M")
    @to = params[:to] || DateTime.now.strftime("%Y-%m-%dT%H:%M")
    all_values = "Dynamodb::#{@sensor.dynamodb_table}".constantize.range(@sensor.ball.name, @from.to_time, @to.to_time) || []
    if params[:kalman]
      @values =  Kalman.new(all_values,@sensor.name, @q.to_f , @r.to_f).filtered_values
    else
      @values = all_values
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sensor_params
    params.require(:sensor).permit(:name, :status, :unit, :ball_id, :dynamodb_table)
  end
end
