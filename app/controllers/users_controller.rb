class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authorize_edit, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users.as_json(:except => [:password_digest, :created_at, :updated_at]))
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
    json_response(@user.as_json(:except => [:password_digest, :created_at, :updated_at]))
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

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :phone, :firstName, :lastName, :isExaminer, :bio, :rates)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_edit
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @user != current_user
  end
end
