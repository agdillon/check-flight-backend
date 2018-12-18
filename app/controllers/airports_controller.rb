class AirportsController < ApplicationController
  before_action :set_user, only: [:get_airports, :put_airports]

  # GET /airports
  def index
    @airports = Airport.all
    # json_response(@airports)
    render json: @airports.as_json(include: [:users.as_json(:except => [:password_digest, :created_at, :updated_at])]), status: status
  end

  # GET /airports/:id
  def show
    @airport = Airport.find(params[:id])
    # json_response(@airport)
    render json: @airport.as_json(include: [:users.as_json(:except => [:password_digest, :created_at, :updated_at])]), status: status
  end

  # GET all airports for user (/users/:id/airports)
  def get_airports
    json_response(@user.airports)
  end

  # PUT airports for user (/users/:id/airports)
  # body contains an array of airports you want to add
  def put_airports
    # authorize that they're editing their own info
    if @user == current_user
      @user.airport_users.delete_all

      for airport_id in airport_params.airports do
        @user.airport_users.create!(airport_id)
      end
      head :no_content
    else
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized)
    end
  end

  private

  def airport_params
    params.permit(:airports)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
