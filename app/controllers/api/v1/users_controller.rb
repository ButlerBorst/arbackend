class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]


  def index
      @users = User.all
      render json: { users: @users }, status: :accepted

  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    # cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    # @user.password_digest = BCrypt::Password.create(params[:password], cost: cost)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: 'failed to update user' }, status: :not_acceptable
    end
  end

  def destroy
    @user = @user.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.permit(:id, :username, :password, :game_id, :win, :loss, :points)
  end

end
