class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :get_airports]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users (signup)
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # GET all airports for user (/users/:id/airports)
  def get_airports
    json_response(@user.airports)
  end

  private

  def user_params
    params.permit(:email, :phone, :firstName, :lastName, :isExaminer)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
