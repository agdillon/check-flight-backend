class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:show, :update, :destroy, :get_airports]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update!(user_params)
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
    params.permit(:email, :password, :password_confirmation, :phone, :firstName, :lastName, :isExaminer, :bio, :rates)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
