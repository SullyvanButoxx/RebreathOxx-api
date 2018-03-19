class SensorsController < ApplicationController
  before_action :set_rebreather
  before_action :set_rebreather_sensor, only: [:show, :update, :destroy]

  # GET /rebreathers/:rebreather_id/sensors
  def index
    json_response(@rebreather.sensors)
  end

  # GET /rebreathers/:rebreather_id/sensors/:id
  def show
    json_response(@sensor)
  end

  # POST /rebreathers/:rebreather_id/sensors
  def create
    @rebreather.sensors.create!(sensor_params)
    json_response(@rebreather, :created)
  end

  # PUT /rebreathers/:rebreather_id/sensors/:id
  def update
    @sensor.update(sensor_params)
    head :no_content
  end

  # DELETE /rebreathers/:rebreather_id/sensors/:id
  def destroy
    @sensor.destroy
    head :no_content
  end

  private

  def sensor_params
    params.permit(:position, :serial_number, :install_date)
  end

  def set_rebreather
    @rebreather = Rebreather::find(params[:rebreather_id])
  end

  def set_rebreather_sensor
    @sensor = @rebreather.sensors.find_by!(id: params[:id]) if @rebreather
  end
end
