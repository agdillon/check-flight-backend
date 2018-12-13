class AvailsController < ApplicationController
  before_action :set_user, only: [:index, :show, :create, :update, :destroy]
  before_action :set_avail, only: [:show, :update, :destroy]

  # GET /users/:user_id/avails
  def index
    json_response(@user.avails)
  end

  # GET /users/:user_id/avails/:id
  def show
    json_response(@avail)
  end

  # POST /users/:user_id/avails
  def create
    @user.avails.create!(avail_params)
    json_response(@avail, :created)
  end

  # PUT /users/:user_id/avails/:id
  def update
    @avail.update(avail_params)
    head :no_content
  end

  # DELETE /users/:user_id/avails/:id
  def destroy
    @avail.destroy
    head :no_content
  end

  # POST /avails/search
  def search
    searchDate = Date.parse(params[:date])
    result = avails.where(date: searchDate.all_day)  

    json_response(result)
  end

  private

  def avail_params
    params.permit(:date, :morning, :afternoon) # do we need to put the foreign key (user id) here?
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_avail
    @avail = @user.avails.find_by!(id: params[:id]) if @user
  end
end
