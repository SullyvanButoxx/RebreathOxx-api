class RebreathersController < ApplicationController
  before_action :set_rebreather, only: [:show, :update, :destroy]

  # GET /rebreathers
  def index
    @rebreathers = Rebreather.all
    json_response(@rebreathers)
  end

  # POST /rebreathers
  def create
    @rebreather = Rebreather.create!(rebreather_params)
    json_response(@rebreather, :created)
  end

  # GET /rebreathers/:id
  def show
    json_response(@rebreather)
  end

  # PUT /rebreathers/:id
  def update
    @rebreather.update(rebreather_params)
    head :no_content
  end

  # DELETE /rebreathers/:id
  def destroy
    @rebreather.destroy
    head :no_content
  end

  private

  def rebreather_params
    # whitelist params
    params.permit(:name)
  end

  def set_rebreather
    @rebreather = Rebreather.find(params[:id])
  end
end
