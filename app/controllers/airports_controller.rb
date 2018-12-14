class AirportsController < ApplicationController
  # GET /airports
  def index
    @airports = Airport.all
    json_response(@airports)
  end

  # GET /airports/:id
  def show
    @airport = Airport.find(params[:id])
    json_response(@airport)
  end
end
