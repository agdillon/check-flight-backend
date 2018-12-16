class AirportsController < ApplicationController
  # GET /airports
  def index
    @airports = Airport.all
    # json_response(@airports)
    render json: @airports.as_json(include: [:users]), status: status
  end

  # GET /airports/:id
  def show
    @airport = Airport.find(params[:id])
    # json_response(@airport)
    render json: @airport.as_json(include: [:users]), status: status
  end
end
